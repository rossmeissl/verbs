module Verbs
  module Conjugator
    extend self

    class Conjugations
      include Singleton

      attr_reader :irregulars, :single_terminal_consonants, :copulars

      def initialize
        @irregulars, @single_terminal_consonants, @copulars = {}, [], {}
      end

      def irregular(infinitive, preterite = nil, past_participle = nil, &blk)
        if block_given?
          irregular = ::Verbs::Verb.new infinitive, &blk
        else
          raise ArgumentError, "Standard irregular verbs must specify preterite and past participle forms" unless preterite and past_participle
          irregular = ::Verbs::Verb.new infinitive, :preterite => preterite, :past_participle => past_participle
        end
        @irregulars[infinitive] = irregular
      end

      def single_terminal_consonant(infinitive)
        @single_terminal_consonants << infinitive
      end
    end

    def conjugations
      if block_given?
        yield Conjugations.instance
      else
        Conjugations.instance
      end
    end

    def conjugate(infinitive, options = {})
      infinitive = infinitive.dup if infinitive.is_a?(String)

      tense = options[:tense] ||         :present    # present, past, future
      person = options[:person] ||       :third      # first, second, third
      plurality = options[:plurality] || :singular   # singular, plural
      diathesis = options[:diathesis] || :active     # active, passive
      mood = options[:mood] ||           :indicative # imperative, subjunctive
      aspect = options[:aspect] ||       :habitual   # perfective, habitual, progressive, perfect, prospective

      check_for_improper_constructions(tense, person, mood)

      form = form_for(tense, aspect)

      conjugation = form.map { |e| resolve e, infinitive, tense, person, plurality, mood }.join(' ').strip

      if options[:subject]
        actor = options.delete(:subject)
        actor = subject(options).humanize if actor.is_a?(TrueClass)
      end

      "#{actor} #{conjugation}".strip
    end

    def subject(options)
      case [options[:person], options[:plurality]]
      when [:first, :singular]
        'I'
      when [:first, :plural]
        'we'
      when [:second, :singular], [:second, :plural]
        'you'
      when [:third, :singular]
        'he'
      when [:third, :plural]
        'they'
      end
    end

    private

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

    def inflect(infinitive, inflection, person, plurality, mood)
      send(*([inflection, infinitive, person, plurality, mood][0, method(inflection).arity + 1]))
    end

    def present(infinitive, person, plurality, mood)
      if verb = conjugations.irregulars[infinitive]
        conjugate_irregular(verb, :tense => :present, :person => person, :plurality => plurality, :mood => mood)
      elsif person == :third and plurality == :singular and not mood == :subjunctive
        present_third_person_singular_form_for infinitive
      else
        infinitive
      end
    end

    def past(infinitive, person, plurality, mood)
      if verb = conjugations.irregulars[infinitive]
        conjugate_irregular(verb, :tense => :past, :person => person, :plurality => plurality, :mood => mood)
      else
        regular_preterite_for infinitive
      end
    end

    def present_participle(infinitive)
      if infinitive.to_s.match(/#{CONSONANT_PATTERN}#{VOWEL_PATTERN}#{CONSONANT_PATTERN}$/) and !conjugations.single_terminal_consonants.include?(infinitive.to_sym)
        present_participle_with_doubled_terminal_consonant_for infinitive
      elsif infinitive.to_s.match(/c$/)
        infinitive.to_s.concat('king').to_sym
      elsif infinitive.to_s.match(/^be$/) or infinitive.to_s.match(/ye$/) or infinitive.to_s.match(/oe$/) or infinitive.to_s.match(/nge$/) or infinitive.to_s.match(/ee$/)
        infinitive.to_s.concat('ing').to_sym
      elsif infinitive.to_s.match(/ie$/)
        infinitive.to_s[0..-2].concat('ying').to_sym
      elsif infinitive.to_s.match(/e$/)
        infinitive.to_s[0..-2].concat('ing').to_sym
      else
        infinitive.to_s[0..-1].concat('ing').to_sym
      end
    end

    def past_participle(infinitive)
      if verb = conjugations.irregulars[infinitive]
        conjugate_irregular(verb, :tense => :past, :derivative => :participle)
      else
        regular_preterite_for infinitive
      end
    end

    def conjugate_irregular(verb, options)
      return verb[options] if verb[options]

      tense = options[:tense]
      person = options[:person]
      plurality = options[:plurality]
      derivative = options[:derivative]

      if [tense, person, plurality] == [:present, :third, :singular]
        present_third_person_singular_form_for verb
      elsif [tense, derivative] == [:past, :participle]
        verb.past_participle
      elsif tense == :present
        verb.infinitive
      elsif tense == :past
        verb.preterite
      end
    end

    def present_third_person_singular_form_for(verb)
      infinitive = verb.is_a?(Verb) ? verb.infinitive.to_s : verb.to_s

      if infinitive =~ /[a-z&&#{CONSONANT_PATTERN}]y$/i
        infinitive[0..-2] + 'ies'
      elsif infinitive =~ /(ss|sh|t?ch|zz|x|#{CONSONANT_PATTERN}o)$/i
        infinitive + 'es'
      elsif infinitive =~ /[^s]s$/i
        infinitive + 'ses'
      else
        infinitive + 's'
      end
    end

    def regular_preterite_for(verb)
      infinitive = verb.is_a?(Verb) ? verb.infinitive.to_s : verb.to_s

      if verb.to_s.match(/#{CONSONANT_PATTERN}#{VOWEL_PATTERN}#{DOUBLED_CONSONANT_PATTERN}$/) and !conjugations.single_terminal_consonants.include?(verb.to_sym)
        regular_preterite_with_doubled_terminal_consonant_for verb
      elsif verb.to_s.match(/#{CONSONANT_PATTERN}e$/) or verb.to_s.match(/ye$/) or verb.to_s.match(/oe$/) or verb.to_s.match(/nge$/) or verb.to_s.match(/ie$/) or verb.to_s.match(/ee$/)
        infinitive.to_s.concat('d').to_sym
      elsif verb.to_s.match(/#{CONSONANT_PATTERN}y$/)
        infinitive.to_s.chomp('y').concat('ied').to_sym
      else
        infinitive.to_s.concat('ed').to_sym
      end
    end

    def regular_preterite_with_doubled_terminal_consonant_for(verb)
      regular_preterite_for verb.to_s.concat(verb.to_s[-1,1]).to_sym
    end

    def present_participle_with_doubled_terminal_consonant_for(verb)
      present_participle verb.to_s.concat(verb.to_s[-1,1]).to_sym
    end

    def form_for(tense, aspect)
      form = []
      if tense == :future
        form << 'will'
        form << :infinitive if aspect == :habitual
        form.concat ['have', :past_participle] if aspect == :perfect
        form.concat ['be having', :past_participle] if aspect == :perfective
        form.concat ['be', :present_participle] if aspect == :progressive
        form.concat ['be about to', :infinitive] if aspect == :prospective
      else
        form.concat ['usually', :past_participle] if [tense, aspect] == [:past, :habitual]
        form.concat [:have, :past_participle] if aspect == :perfect
        form << :past if [tense, aspect] == [:past, :perfective]
        form.concat [:be, :present_participle] if aspect == :progressive
        form.concat [:be, 'about to', :infinitive] if aspect == :prospective
        form << :present if [tense, aspect] == [:present, :habitual]
        form.concat [:be, 'having', :past_participle] if [tense, aspect] == [:present, :perfective]
      end
      form
    end

    def check_for_improper_constructions(tense, person, mood)
      if mood == :imperative and not (person == :second and tense == :present)
        raise Verbs::ImproperConstruction, 'The imperative mood requires present tense and second person'
      end
    end
  end
end
