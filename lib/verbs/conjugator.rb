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
    
    def present_third_person_singular_form_for(verb)
      infinitive = case verb
      when Verb
        verb.infinitive
      when String, Symbol
        verb.to_sym
      end
      infinitive.to_s.concat('s').to_sym
    end
    
  end
end
