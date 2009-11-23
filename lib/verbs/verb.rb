module Verbs
  class Verb
    attr_reader :infinitive
    
    def initialize(infinitive, options = {}, &blk)
      @infinitive = infinitive
      if block_given?
        yield self
      else
        @preterite = options[:preterite]
        @past_participle = options[:past_participle]
      end
    end
    
    def form(word, options = {})
      raise ArgumentError, 'Irregular verb specifications must identify tense and must identify either derivative or person and plurality' unless options[:tense] and (options[:derivative] or (options[:person] and options[:plurality]))
      
      tense = options[:tense]

      @forms ||= {}
      @forms[:present] ||= {}
      @forms[:past] ||= {}
      if derivative = options[:derivative]
        @forms[tense][derivative] = word
      elsif person = options[:person]
        @forms[tense][person] ||= {}
        @forms[tense][person][options[:plurality]] = word
      end
    end
    
    def [](options = {})
      options.assert_valid_keys :tense, :person, :plurality, :derivative
      tense, person, plurality, derivative = options[:tense], options[:person], options[:plurality], options[:derivative]
      if tense and person and plurality
        @forms[tense].andand[person].andand[plurality]
      elsif tense and derivative
        @forms[tense].andand[derivative]
      end
    end
  end
end
