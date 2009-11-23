require 'helper'

class TestVerbs < Test::Unit::TestCase
  def test_copular_conjugation
    assert_equal :am, Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :first, :plurality => :singular)
    assert_equal :are, Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :second, :plurality => :singular)
    assert_equal :is, Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :third, :plurality => :singular)
    assert_equal :are, Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :first, :plurality => :plural)
    assert_equal :are, Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :third, :plurality => :plural)
    assert_equal :was, Verbs::Conjugator.conjugate(:be, :tense => :past, :person => :first, :plurality => :singular)
    assert_equal :were, Verbs::Conjugator.conjugate(:be, :tense => :past, :person => :second, :plurality => :singular)
    assert_equal :was, Verbs::Conjugator.conjugate(:be, :tense => :past, :person => :third, :plurality => :singular)
    assert_equal :were, Verbs::Conjugator.conjugate(:be, :tense => :past, :person => :first, :plurality => :plural)
    assert_equal :were, Verbs::Conjugator.conjugate(:be, :tense => :past, :person => :third, :plurality => :plural)
  end
  def test_irregular_conjugation 
    assert_equal :break, Verbs::Conjugator.conjugate(:break, :tense => :present, :person => :first, :plurality => :singular) 
    assert_equal :break, Verbs::Conjugator.conjugate(:break, :tense => :present, :person => :second, :plurality => :singular) 
    assert_equal :breaks, Verbs::Conjugator.conjugate(:break, :tense => :present, :person => :third, :plurality => :singular) 
    assert_equal :break, Verbs::Conjugator.conjugate(:break, :tense => :present, :person => :first, :plurality => :plural) 
    assert_equal :break, Verbs::Conjugator.conjugate(:break, :tense => :present, :person => :third, :plurality => :plural) 
    assert_equal :broke, Verbs::Conjugator.conjugate(:break, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :broke, Verbs::Conjugator.conjugate(:break, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :broke, Verbs::Conjugator.conjugate(:break, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :broke, Verbs::Conjugator.conjugate(:break, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :broke, Verbs::Conjugator.conjugate(:break, :tense => :past, :person => :first, :plurality => :singular) 
  end
end
