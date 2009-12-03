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
    assert_equal :has, Verbs::Conjugator.conjugate(:have, :tense => :present, :person => :third, :plurality => :singular) 
  end
  def test_irregular_conjugation_with_terminal_y
    assert_equal :flies, Verbs::Conjugator.conjugate(:fly, :tense => :present, :person => :third, :plurality => :singular) 
    assert_equal :carried, Verbs::Conjugator.conjugate(:carry, :tense => :past, :person => :third, :plurality => :singular) 
    assert_equal :stayed, Verbs::Conjugator.conjugate(:stay, :tense => :past, :person => :third, :plurality => :singular) 
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
  def test_regular_conjugation_with_terminal_e
    assert_equal :created, Verbs::Conjugator.conjugate(:create, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :created, Verbs::Conjugator.conjugate(:create, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :created, Verbs::Conjugator.conjugate(:create, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :created, Verbs::Conjugator.conjugate(:create, :tense => :past, :person => :first, :plurality => :singular) 
    assert_equal :created, Verbs::Conjugator.conjugate(:create, :tense => :past, :person => :first, :plurality => :singular) 
  end
  def test_regular_conjugation_with_unusual_terminal_e
    assert_equal :dyed, Verbs::Conjugator.conjugate(:dye, :tense => :past, :person => :first, :plurality => :singular)
    assert_equal :hoed, Verbs::Conjugator.conjugate(:hoe, :tense => :past, :person => :first, :plurality => :singular)
    assert_equal :singed, Verbs::Conjugator.conjugate(:singe, :tense => :past, :person => :first, :plurality => :singular)
    assert_equal :tied, Verbs::Conjugator.conjugate(:tie, :tense => :past, :person => :first, :plurality => :singular)
    assert_equal :agreed, Verbs::Conjugator.conjugate(:agree, :tense => :past, :person => :first, :plurality => :singular)
  end
  def test_conjugation_with_terminal_sibilance
    assert_equal :passes, Verbs::Conjugator.conjugate(:pass, :tense => :present, :person => :third, :plurality => :singular)
    assert_equal :buzzes, Verbs::Conjugator.conjugate(:buzz, :tense => :present, :person => :third, :plurality => :singular)
    assert_equal :coaxes, Verbs::Conjugator.conjugate(:coax, :tense => :present, :person => :third, :plurality => :singular)
    assert_equal :washes, Verbs::Conjugator.conjugate(:wash, :tense => :present, :person => :third, :plurality => :singular)
    assert_equal :watches, Verbs::Conjugator.conjugate(:watch, :tense => :present, :person => :third, :plurality => :singular)
  end
  def test_conjugation_with_subject
    assert_equal 'Matz is', Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :third, :plurality => :singular, :subject => 'Matz')
    assert_equal 'We are', Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :first, :plurality => :plural, :subject => true)
  end
end
