require 'helper'
require 'active_support/version'
%w{
  active_support/core_ext/object/misc
  active_support/inflector
}.each do |active_support_3_requirement|
  require active_support_3_requirement
end if ActiveSupport::VERSION::MAJOR == 3

class TestVerbs < Test::Unit::TestCase
  def test_copular_conjugation
    assert_equal 'am', Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :first, :plurality => :singular, :aspect => :habitual)
    assert_equal 'are', Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :second, :plurality => :singular, :aspect => :habitual)
    assert_equal 'is', Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
    assert_equal 'are', Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :first, :plurality => :plural, :aspect => :habitual)
    assert_equal 'are', Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :third, :plurality => :plural, :aspect => :habitual)
    assert_equal 'was', Verbs::Conjugator.conjugate(:be, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'were', Verbs::Conjugator.conjugate(:be, :tense => :past, :person => :second, :plurality => :singular, :aspect => :perfective)
    assert_equal 'was', Verbs::Conjugator.conjugate(:be, :tense => :past, :person => :third, :plurality => :singular, :aspect => :perfective)
    assert_equal 'were', Verbs::Conjugator.conjugate(:be, :tense => :past, :person => :first, :plurality => :plural, :aspect => :perfective)
    assert_equal 'were', Verbs::Conjugator.conjugate(:be, :tense => :past, :person => :third, :plurality => :plural, :aspect => :perfective)
  end
  def test_irregular_conjugation
    assert_equal 'break', Verbs::Conjugator.conjugate(:break, :tense => :present, :person => :first, :plurality => :singular, :aspect => :habitual)
    assert_equal 'break', Verbs::Conjugator.conjugate(:break, :tense => :present, :person => :second, :plurality => :singular, :aspect => :habitual)
    assert_equal 'breaks', Verbs::Conjugator.conjugate(:break, :tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
    assert_equal 'break', Verbs::Conjugator.conjugate(:break, :tense => :present, :person => :first, :plurality => :plural, :aspect => :habitual)
    assert_equal 'break', Verbs::Conjugator.conjugate(:break, :tense => :present, :person => :third, :plurality => :plural, :aspect => :habitual)
    assert_equal 'broke', Verbs::Conjugator.conjugate(:break, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'broke', Verbs::Conjugator.conjugate(:break, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'broke', Verbs::Conjugator.conjugate(:break, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'broke', Verbs::Conjugator.conjugate(:break, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'broke', Verbs::Conjugator.conjugate(:break, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'has', Verbs::Conjugator.conjugate(:have, :tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
  end
  def test_irregular_conjugation_with_terminal_y
    assert_equal 'flies', Verbs::Conjugator.conjugate(:fly, :tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
    assert_equal 'carried', Verbs::Conjugator.conjugate(:carry, :tense => :past, :person => :third, :plurality => :singular, :aspect => :perfective)
    assert_equal 'stayed', Verbs::Conjugator.conjugate(:stay, :tense => :past, :person => :third, :plurality => :singular, :aspect => :perfective)
  end
  def test_regular_conjugation
    assert_equal 'accept', Verbs::Conjugator.conjugate(:accept, :tense => :present, :person => :first, :plurality => :singular, :aspect => :habitual)
    assert_equal 'accept', Verbs::Conjugator.conjugate(:accept, :tense => :present, :person => :second, :plurality => :singular, :aspect => :habitual)
    assert_equal 'accepts', Verbs::Conjugator.conjugate(:accept, :tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
    assert_equal 'accept', Verbs::Conjugator.conjugate(:accept, :tense => :present, :person => :first, :plurality => :plural, :aspect => :habitual)
    assert_equal 'accept', Verbs::Conjugator.conjugate(:accept, :tense => :present, :person => :third, :plurality => :plural, :aspect => :habitual)
    assert_equal 'accepted', Verbs::Conjugator.conjugate(:accept, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'accepted', Verbs::Conjugator.conjugate(:accept, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'accepted', Verbs::Conjugator.conjugate(:accept, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'accepted', Verbs::Conjugator.conjugate(:accept, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'accepted', Verbs::Conjugator.conjugate(:accept, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
  end
  def test_regular_conjugation_with_terminal_single_consonant
    assert_equal 'shipped', Verbs::Conjugator.conjugate(:ship, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
  end
  def test_regular_conjugation_with_irregular_terminal_consonant
    assert_equal 'abandoned', Verbs::Conjugator.conjugate(:abandon, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
  end
  def test_regular_conjugation_with_ean_suffix
    assert_equal 'cleaned',  Verbs::Conjugator.conjugate(:clean, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'am cleaning', Verbs::Conjugator.conjugate(:clean, :tense => :present, :person => :first, :plurality => :singular, :aspect => :progressive)
  end
  def test_regular_non_doubled_ending_consonant
    assert_equal 'fixes', Verbs::Conjugator.conjugate(:fix, :tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
    assert_equal 'fixed',  Verbs::Conjugator.conjugate(:fix, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'faxed',  Verbs::Conjugator.conjugate(:fix, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
  end
  def test_regular_conjugation_with_terminal_e
    assert_equal 'created', Verbs::Conjugator.conjugate(:create, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
  end
  def test_regular_conjugation_with_unusual_terminal_e
    assert_equal 'dyed', Verbs::Conjugator.conjugate(:dye, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'hoed', Verbs::Conjugator.conjugate(:hoe, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'singed', Verbs::Conjugator.conjugate(:singe, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'tied', Verbs::Conjugator.conjugate(:tie, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
    assert_equal 'agreed', Verbs::Conjugator.conjugate(:agree, :tense => :past, :person => :first, :plurality => :singular, :aspect => :perfective)
  end
  def test_conjugation_with_terminal_sibilance
    assert_equal 'passes', Verbs::Conjugator.conjugate(:pass, :tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
    assert_equal 'buzzes', Verbs::Conjugator.conjugate(:buzz, :tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
    assert_equal 'coaxes', Verbs::Conjugator.conjugate(:coax, :tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
    assert_equal 'washes', Verbs::Conjugator.conjugate(:wash, :tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
    assert_equal 'watches', Verbs::Conjugator.conjugate(:watch, :tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
  end
  def test_conjugation_with_subject
    assert_equal 'Matz is', Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :third, :plurality => :singular, :subject => 'Matz', :aspect => :habitual)
    assert_equal 'We are', Verbs::Conjugator.conjugate(:be, :tense => :present, :person => :first, :plurality => :plural, :subject => true, :aspect => :habitual)
  end
  def test_conjugation_with_false_subject
    assert_equal 'accepts', Verbs::Conjugator.conjugate(:accept, :subject => false)
  end
  def test_core_access
    assert_equal :accepts, :accept.verb.conjugate(:tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
    assert_equal 'accepts', 'accept'.verb.conjugate(:tense => :present, :person => :third, :plurality => :singular, :aspect => :habitual)
  end
  def test_aspects
    Verbs::Conjugator.with_options :person => :first, :plurality => :singular, :subject => true do |standard|
      assert_equal 'I usually accepted',        standard.conjugate(:accept, :tense => :past, :aspect => :habitual)
      assert_equal 'I had accepted',            standard.conjugate(:accept, :tense => :past, :aspect => :perfect)
      assert_equal 'I accepted',                standard.conjugate(:accept, :tense => :past, :aspect => :perfective)
      assert_equal 'I was accepting',           standard.conjugate(:accept, :tense => :past, :aspect => :progressive)
      assert_equal 'I was about to accept',     standard.conjugate(:accept, :tense => :past, :aspect => :prospective)
      assert_equal 'I accept',                  standard.conjugate(:accept, :tense => :present, :aspect => :habitual)
      assert_equal 'I have accepted',           standard.conjugate(:accept, :tense => :present, :aspect => :perfect)
      assert_equal 'I am having accepted',      standard.conjugate(:accept, :tense => :present, :aspect => :perfective)
      assert_equal 'I am accepting',            standard.conjugate(:accept, :tense => :present, :aspect => :progressive)
      assert_equal 'I am about to accept',      standard.conjugate(:accept, :tense => :present, :aspect => :prospective)
      assert_equal 'I will accept',             standard.conjugate(:accept, :tense => :future, :aspect => :habitual)
      assert_equal 'I will have accepted',      standard.conjugate(:accept, :tense => :future, :aspect => :perfect)
      assert_equal 'I will be having accepted', standard.conjugate(:accept, :tense => :future, :aspect => :perfective)
      assert_equal 'I will be accepting',       standard.conjugate(:accept, :tense => :future, :aspect => :progressive)
      assert_equal 'I will be about to accept', standard.conjugate(:accept, :tense => :future, :aspect => :prospective)
    end
  end
end
