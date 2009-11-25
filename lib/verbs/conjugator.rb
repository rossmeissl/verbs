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
      tense = options[:tense] ||         :present
      person = options[:person] ||       :third
      plurality = options[:plurality] || :singular
      diathesis = options[:diathesis] || :active
      mood = options[:mood] ||           :indicative
      
      if verb = conjugations.irregulars[infinitive]
        verb[options] || conjugate_irregular(verb, options)
      else
        conjugate_regular(infinitive, options)
      end
    end
    
    private
    
    def conjugate_irregular(verb, options)
      tense = options[:tense]
      person = options[:person]
      plurality = options[:plurality]
      if [tense, person, plurality] == [:present, :third, :singular]
        present_third_person_singular_form_for verb
      elsif tense == :present
        verb.infinitive
      elsif tense == :past
        verb.preterite
      end
    end
    
    def conjugate_regular(verb, options)
      tense = options[:tense]
      person = options[:person]
      plurality = options[:plurality]
      if [tense, person, plurality] == [:present, :third, :singular]
        present_third_person_singular_form_for verb
      elsif tense == :present
        verb
      elsif tense == :past
        regular_preterite_for verb
      end
    end
    
    def present_third_person_singular_form_for(verb)
      infinitive = case verb
      when Verb
        verb.infinitive
      when String, Symbol
        verb.to_sym
      end
      if infinitive.to_s.match(/#{CONSONANT_PATTERN}y$/)
        infinitive.to_s.gsub(/y$/, 'ies').to_sym
      elsif infinitive.to_s.match(/[szx]$/) or infinitive.to_s.match(/[sc]h$/)
        infinitive.to_s.concat('es').to_sym
      else
        infinitive.to_s.concat('s').to_sym
      end
    end
    
    def regular_preterite_for(verb)
      infinitive = case verb
      when Verb
        verb.infinitive
      when String, Symbol
        verb.to_sym
      end
      if verb.to_s.match(/#{VOWEL_PATTERN}#{CONSONANT_PATTERN}$/) and !conjugations.single_terminal_consonants.include?(verb)
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
    
  end
end
