# frozen_string_literal: true

require 'singleton'
require 'time'
require 'active_support'
require 'active_support/core_ext'
require 'verbs/verb'
require 'verbs/conjugator'
require 'verbs/conjugations'
require 'verbs/verblike'
require 'verbs/improper_construction'

module Verbs
  CONSONANTS = %w[b c d f g h j k l m n p q r s t v w x z].freeze
  CONSONANT_PATTERN = "[#{CONSONANTS.join}]"
  DOUBLED_CONSONANTS = %w[b c d f g h j k l m n p q r s t z].freeze
  DOUBLED_CONSONANT_PATTERN = "[#{DOUBLED_CONSONANTS.join}]"
  VOWELS = %w[a e i o u y].freeze
  VOWEL_PATTERN = "[#{VOWELS.join}]"
end
