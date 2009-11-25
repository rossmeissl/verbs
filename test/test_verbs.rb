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
  def test_irregular_conjugation_with_terminal_y
    assert_equal :flies, Verbs::Conjugator.conjugate(:fly, :tense => :present, :person => :third, :plurality => :singular) 
  end
  def test_regular_conjugation
    assert_equal :accept, Verbs::Conjugator.conjugate(:accept, :tense => :present, :person => :first, :plurality => :singular) 
    assert_equal :accept, Verbs::Conjugator.conjugate(:accept, :tense => :present, :person => :second, :plurality => :singular) 
    assert_equal :accepts, Verbs::Conjugator.conjugate(:accept, :tense => :present, :person => :third, :plurality => :singular) 
    assert_equal :accept, Verbs::Conjugator.conjugate(:accept, :tense => :present, :person => :first, :plurality => :plural) 
    assert_equal :accept, Verbs::Conjugator.conjugate(:accept, :tense => :present, :person => :third, :plurality => :plural) 
    assert_equal :accepted, Verbs::Conjugator.conjugate(:accept, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :accepted, Verbs::Conjugator.conjugate(:accept, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :accepted, Verbs::Conjugator.conjugate(:accept, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :accepted, Verbs::Conjugator.conjugate(:accept, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :accepted, Verbs::Conjugator.conjugate(:accept, :tense => :past, :person => :first, :plurality => :singular) 
  end
  def test_regular_conjugation_with_terminal_single_consonant
    assert_equal :shipped, Verbs::Conjugator.conjugate(:ship, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :shipped, Verbs::Conjugator.conjugate(:ship, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :shipped, Verbs::Conjugator.conjugate(:ship, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :shipped, Verbs::Conjugator.conjugate(:ship, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :shipped, Verbs::Conjugator.conjugate(:ship, :tense => :past, :person => :first, :plurality => :singular) 
  end
  def test_regular_conjugation_with_irregular_terminal_consonant
    assert_equal :abandoned, Verbs::Conjugator.conjugate(:abandon, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :abandoned, Verbs::Conjugator.conjugate(:abandon, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :abandoned, Verbs::Conjugator.conjugate(:abandon, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :abandoned, Verbs::Conjugator.conjugate(:abandon, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :abandoned, Verbs::Conjugator.conjugate(:abandon, :tense => :past, :person => :first, :plurality => :singular) 
  end
end
