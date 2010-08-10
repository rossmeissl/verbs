require 'singleton'
require 'verbs/verb'
require 'verbs/conjugator'
require 'verbs/conjugations'
require 'verbs/verblike'
require 'andand'
require 'active_support'

module Verbs
  CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x z)
  CONSONANT_PATTERN = "[#{CONSONANTS.join}]"
  DOUBLED_CONSONANTS = %w(b c d f g h j k l m n p q r s t w z)
  DOUBLED_CONSONANT_PATTERN = "[#{DOUBLED_CONSONANTS.join}]"
  VOWELS = %w(a e i o u y)
  VOWEL_PATTERN = "[#{VOWELS.join}]"
end
