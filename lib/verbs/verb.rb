# frozen_string_literal: true

module Verbs
  class Verb
    attr_reader :infinitive, :preterite, :past_participle

    def initialize(infinitive, options = {})
      @infinitive = infinitive
      @forms = {}
      if block_given?
        yield self
      else
        @preterite = options[:preterite]
        @past_participle = options[:past_participle]
      end
    end

    def form(word, options = {})
      unless options[:tense] && (options[:derivative] || options[:mood] || (options[:person] && options[:plurality]))
        raise ArgumentError,
              'Irregular verb specifications must identify tense and must identify either derivative, mood, or person and plurality'
      end

      tense = options[:tense]

      @forms[:present] ||= {}
      @forms[:past] ||= {}
      if derivative = options[:derivative]
        @forms[tense][derivative] = word
      elsif mood = options[:mood]
        @forms[tense][mood] = word
      elsif person = options[:person]
        @forms[tense][person] ||= {}
        @forms[tense][person][options[:plurality]] = word
      end
    end

    def [](options = {})
      tense = options[:tense]
      person = options[:person]
      plurality = options[:plurality]
      derivative = options[:derivative]
      mood = options[:mood]
      if tense && person && plurality && mood
        @forms[tense].try(:[], mood) || @forms[tense].try(:[], person).try(:[], plurality)
      elsif tense && derivative
        @forms[tense].try(:[], derivative)
      end
    end
  end
end
