require 'helper'

class TestVerbs < Test::Unit::TestCase
  def test_copular_conjugation
    assert_equal :am, Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :first, :plurality => :singular)
  end
  def test_irregular_conjugation 
    assert_equal :break, Verbs::Conjugator.conjugate(:break, :tense => :present, :person => :first, :plurality => :singular) 
  end
end
