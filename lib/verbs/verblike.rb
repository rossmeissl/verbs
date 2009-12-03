module Verbs
  module Verblike
    class Wrapper
      def initialize(base)
        @base = base
      end
      
      def conjugate(options)
        words = @base.to_s.split(' ')
        words.shift if words.first.downcase == 'to'
        infinitive = words.shift.to_sym
        conjugation = ::Verbs::Conjugator.conjugate infinitive, options
        conjugated = words.unshift(conjugation.to_s).join(' ')
        @base.is_a?(Symbol) ? conjugated.to_sym : conjugated
      end
    end
    
    module Access
      def verb
        ::Verbs::Verblike::Wrapper.new self
      end
    end
  end
end

class String
  include ::Verbs::Verblike::Access
end

class Symbol
  include ::Verbs::Verblike::Access
end
