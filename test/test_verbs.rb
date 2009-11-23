require 'helper'

class TestVerbs < Test::Unit::TestCase
  def test_conjugation
    assert_equal :break, Verbs::Conjugator.conjugate(:break, :tense => :present, :person => :first, :plurality => :singular) 
  end
end
