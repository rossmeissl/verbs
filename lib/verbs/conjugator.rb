# frozen_string_literal: true

# The program conjugates most common english verbs with the following option:
# * :tense => :past or :present or :future (default: :present)
# * :person => :first or :second or :third (default: :third)
# * :plurality => :singular or :plural (default: :singular)
# * :aspect => :habitual or :perfect or :perfective or :progressive or :prospective (default: :habitual, or :perfective for past tense)
# * :mood => :indicative or :imperative or :subjunctive (default: :indicative)
# * :diathesis => :active or :passive (default: :active)
#
# Author::    Andy Rossmeissl
# Copyright:: Copyright (c) 2009 Andy Rossmeissl
# License::   Found in LICENSE file

module Verbs
  module Conjugator
    extend self

    # This class determines the conjugations from the given options (or defaults)
    # conjugations are then applied to the verb
    class Conjugations
      include Singleton

      # permit outside functions access to these variables
      attr_reader :irregulars, :single_terminal_consonants, :copulars

      # Creates initial variables for class
      def initialize
        @irregulars = {}
        @single_terminal_consonants = []
        @copulars = {}
      end

      # Determines irregular verbs from the expression
      # Params:
      # * infinitive, the given verb
      # * preterite, denote events that took place in the past
      # * past_participle, form of a verb, ending in 'ed'
      # * &blk, block of code that may be run
      def irregular(infinitive, preterite = nil, past_participle = nil, &blk)
        if block_given?
          # create new Verb object with infinitive and &blk
          irregular = ::Verbs::Verb.new infinitive, &blk
        else
          unless preterite && past_participle
            raise ArgumentError,
                  'Standard irregular verbs must specify preterite and past participle forms'
          end

          # create new Verb object with infinitive, preterite and past_participle
          irregular = ::Verbs::Verb.new infinitive, preterite: preterite, past_participle: past_participle
        end
        @irregulars[infinitive] = irregular
      end

      # Find single terminal consonant with the infinitive
      # Params:
      # * infinitive, the given verb
      def single_terminal_consonant(infinitive)
        @single_terminal_consonants << infinitive
      end
    end

    # Runs a block of code if given in a class instance
    # else only class instance is created
    def conjugations
      if block_given?
        yield Conjugations.instance
      else
        Conjugations.instance
      end
    end

    # Using options given, determine the conjugation and the subject
    # Return the subject, if there is one, and the proper conjugation
    # Params:
    # * infinitive, the given verb
    # * options, the list of parameters to alter the conjugation
    def conjugate(infinitive, options = {})
      infinitive = infinitive.dup if infinitive.is_a?(String)

      # set all options according to parameter, or the default
      tense = options[:tense] ||         :present    # present, past, future
      person = options[:person] ||       :third      # first, second, third
      plurality = options[:plurality] || :singular   # singular, plural
      diathesis = options[:diathesis] || :active     # active, passive
      mood = options[:mood] ||           :indicative # imperative, subjunctive
      aspect = options[:aspect] ||       default_aspect(options) # perfective, habitual, progressive, perfect, prospective

      check_for_improper_constructions(infinitive, tense, person, mood, diathesis) # find incompatabilities
      form = form_for(tense, aspect, diathesis)                                    # find form array based on tense and aspect

      # map form array to conjugation array, applying infinitive and options to the array
      conjugation = form.map { |e| resolve e, infinitive, tense, person, plurality, mood }.join(' ').strip

      if options[:subject]                   # When options includes a subject,
        actor = options.delete(:subject)     # remove from options and make subject humanized
        actor = subject(options).humanize if actor.is_a?(TrueClass)
      end

      "#{actor} #{conjugation}".strip
    end

    # Finds the pronoun associated with the subject for the conjugation
    # Returns the pronoun
    # Params:
    # * options, list of options given to determine conjugation
    def subject(options)
      case [options[:person], options[:plurality]]
      when %i[first singular]
        'I'
      when %i[first plural]
        'we'
      when %i[second singular], %i[second plural]
        'you'
      when %i[third singular]
        'he'
      when %i[third plural]
        'they'
      end
    end

    private

    # Resolves conflictions between options of the conjugation
    # Params:
    # * element,
    # * infinitive, the given verb
    # * tense, an option given by the user
    # * person, an option given by the user
    # * plurality, an option given by the user
    # * mood, an option given by the user
    def resolve(element, infinitive, tense, person, plurality, mood)
      case element
      when String
        element
      when :infinitive
        infinitive
      when :present, :past, :present_participle, :past_participle
        inflect infinitive, element, person, plurality, mood
      when Symbol
        inflect element, tense, person, plurality, mood
      end
    end

    # Change the form to express the proper grammatical function
    # Params:
    # * infinitive,the given verb
    # * inflection, form to be changed
    # * person, an option given by the user
    # * plurality, an option given by the user
    # * mood, an option given by the user
    def inflect(infinitive, inflection, person, plurality, mood)
      send(*[inflection, infinitive, person, plurality, mood][0, method(inflection).arity + 1])
    end

    def present(infinitive, person, plurality, mood)
      if (verb = conjugations.irregulars[infinitive])
        conjugate_irregular(verb, tense: :present, person: person, plurality: plurality, mood: mood)
      elsif (person == :third) && (plurality == :singular) && (mood != :subjunctive)
        present_third_person_singular_form_for infinitive
      else
        infinitive
      end
    end

    # Conjugate verb to past with relevent options determining outcome
    # Params:
    # * infinitive, the given verb
    # * person, the subject of the verb
    # * plurality, an option given by the user
    # * mood, an option given by the user
    def past(infinitive, person, plurality, mood)
      if (verb = conjugations.irregulars[infinitive])
        conjugate_irregular(verb, tense: :past, person: person, plurality: plurality, mood: mood)
      else
        regular_preterite_for infinitive
      end
    end

    # Forming verb to apply present tense endings
    # Params:
    # * infinitive, the given verb
    def present_participle(infinitive)
      if infinitive.to_s.match(/#{CONSONANT_PATTERN}#{VOWEL_PATTERN}#{CONSONANT_PATTERN}$/) &&
         !conjugations.single_terminal_consonants.include?(infinitive.to_sym)
        return present_participle_with_doubled_terminal_consonant_for infinitive
      end

      case infinitive.to_s
      when /c$/
        "#{infinitive}k"
      when /(^be|ye|oe|nge|ee)$/
        infinitive.to_s
      when /ie$/
        "#{infinitive.to_s[0..-2]}y"
      when /#{VOWEL_PATTERN}#{CONSONANT_PATTERN}e$/
        infinitive.to_s[0..-2]
      else
        infinitive.to_s[0..-1]
      end.concat('ing').to_sym
    end

    # Forming verb to apply past tense endings
    # Params:
    # * infinitive, the given verb
    def past_participle(infinitive)
      if (verb = conjugations.irregulars[infinitive])
        conjugate_irregular(verb, tense: :past, derivative: :participle)
      else
        regular_preterite_for infinitive
      end
    end

    #
    # Params:
    # * verb,
    # * options,
    def conjugate_irregular(verb, options)
      return verb[options] if verb[options]

      tense = options[:tense]
      person = options[:person]
      plurality = options[:plurality]
      derivative = options[:derivative]

      if [tense, person, plurality] == %i[present third singular]
        present_third_person_singular_form_for verb
      elsif [tense, derivative] == %i[past participle]
        verb.past_participle
      elsif tense == :present
        verb.infinitive
      elsif tense == :past
        verb.preterite
      end
    end

    # Apply thir person rules to the verb for the conjugation
    # Params:
    # * verb, apply proper third person rules to this
    def present_third_person_singular_form_for(verb)
      infinitive = verb.is_a?(Verb) ? verb.infinitive.to_s : verb.to_s

      case infinitive
      when /[a-z&&#{CONSONANT_PATTERN}]y$/i
        "#{infinitive[0..-2]}ies"
      when /(ss|sh|t?ch|zz|x|#{CONSONANT_PATTERN}o)$/i
        "#{infinitive}es"
      when /[^s]s$/i
        "#{infinitive}ses"
      else
        "#{infinitive}s"
      end
    end

    # Apply the regular past tense to a given verb for the conjugation
    # Params:
    # * verb, apply regular past tense rules to this
    def regular_preterite_for(verb)
      infinitive = verb.is_a?(Verb) ? verb.infinitive.to_s : verb.to_s

      if verb.to_s.match(/#{CONSONANT_PATTERN}#{VOWEL_PATTERN}#{DOUBLED_CONSONANT_PATTERN}$/) &&
         !conjugations.single_terminal_consonants.include?(verb.to_sym)
        return regular_preterite_with_doubled_terminal_consonant_for verb
      end

      case verb.to_s
      when /#{CONSONANT_PATTERN}e$|ye$|oe$|nge$|ie$|ee$/
        infinitive.to_s.concat('d').to_sym
      when /#{CONSONANT_PATTERN}y$/
        infinitive.to_s.chomp('y').concat('ied').to_sym
      else
        infinitive.to_s.concat('ed').to_sym
      end
    end

    # Apply proper rules to consonant endings
    # Params:
    # * verb, apply doule consonant to this
    def regular_preterite_with_doubled_terminal_consonant_for(verb)
      regular_preterite_for verb.to_s.concat(verb.to_s[-1, 1]).to_sym
    end

    # Apply proper rules to consonant endings
    # Params:
    # * verb, apply doule consonant to this
    def present_participle_with_doubled_terminal_consonant_for(verb)
      present_participle verb.to_s.concat(verb.to_s[-1, 1]).to_sym
    end

    # Add appropriate aspects to the tense of the conjugation
    # Params:
    # * tense, an option given by the user
    # * aspect, an option given by the user
    # * diathesis, an option given by the user
    def form_for(tense, aspect, diathesis)
      form = []
      case diathesis
      when :active
        if tense == :future
          form << 'will'
          form << :infinitive if aspect == :habitual
          form.concat ['have', :past_participle] if aspect == :perfect
          form.concat ['be having', :past_participle] if aspect == :perfective
          form.concat ['be', :present_participle] if aspect == :progressive
          form.concat ['be about to', :infinitive] if aspect == :prospective
        else
          form.concat ['used to', :infinitive] if [tense, aspect] == %i[past habitual]
          form.concat %i[have past_participle] if aspect == :perfect
          form << :past if [tense, aspect] == %i[past perfective]
          form.concat %i[be present_participle] if aspect == :progressive
          form.concat [:be, 'about to', :infinitive] if aspect == :prospective
          form << :present if [tense, aspect] == %i[present habitual]
          form.concat [:be, 'having', :past_participle] if [tense, aspect] == %i[present perfective]
        end
      when :passive
        if tense == :future
          form << 'will'
          form.concat ['be', :past_participle] if aspect == :habitual
          form.concat ['have been', :past_participle] if aspect == :perfect
          form.concat ['be being', :past_participle] if aspect == :progressive
          form.concat ['be about to be', :past_participle] if aspect == :prospective
        else
          form.concat ['used to be', :past_participle] if [tense, aspect] == %i[past habitual]
          form.concat [:have, 'been', :past_participle] if aspect == :perfect
          form.concat %i[be past_participle] if [tense, aspect] == %i[past perfective]
          form.concat [:be, 'being', :past_participle] if aspect == :progressive
          form.concat [:be, 'about to be', :past_participle] if aspect == :prospective
          form.concat %i[be past_participle] if [tense, aspect] == %i[present habitual]
        end
      end
      form
    end

    # Confirm an imperative mood contains the present tense and second person
    # Params:
    # * tense, an option given by the user
    # * person, how the conjugation refers to the subject
    # * mood, an option given by the user
    # * diathesis, an option given by the user
    def check_for_improper_constructions(infinitive, tense, person, mood, diathesis)
      if (mood == :imperative) && !((person == :second) && (tense == :present))
        raise Verbs::ImproperConstruction, 'The imperative mood requires present tense and second person'
      end
      if (infinitive.to_sym == :be) && (diathesis == :passive)
        raise Verbs::ImproperConstruction, 'There is no passive diathesis for the copula'
      end
    end

    def default_aspect(options)
      options[:tense] == :past ? :perfective : :habitual
    end
  end
end
