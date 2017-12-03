require 'minitest/autorun'
require_relative 'text_frequency.rb'

describe 'TextFrequency' do
  before do
    @test_tf = TextFrequency.new('test_doc.txt')
  end

  it 'can be instantiated with a local txt file' do
    @test_tf.must_be_instance_of TextFrequency
  end

  describe '#clean_up_text' do
    it 'returns only words' do
      cleaned_test = @test_tf.clean_up_text

      cleaned_test.must_be_instance_of Array
      cleaned_test.must_equal(%w(one morning when-gregor-samsa woke from troubled dreams he found himself transformed in his bed into a horrible vermin he lay on his armour-like back and if he lifted don't))
    end
  end

  describe '#total_words' do
    it 'returns the correct count of words' do
      test_word_count = @test_tf.total_words

      test_word_count.must_equal 29
    end
  end

  describe '#words_frequencies' do
    it 'returns the correct words frequencies' do
      test_words_frequencies = @test_tf.words_frequencies

      test_words_frequencies.must_be_instance_of Hash
      test_words_frequencies.must_equal({"a"=>1, "and"=>1, "armour-like"=>1, "back"=>1, "bed"=>1, "don't"=>1, "dreams"=>1, "found"=>1, "from"=>1, "he"=>3, "himself"=>1, "his"=>2, "horrible"=>1, "if"=>1, "in"=>1, "into"=>1, "lay"=>1, "lifted"=>1, "morning"=>1, "on"=>1, "one"=>1, "transformed"=>1, "troubled"=>1, "vermin"=>1, "when-gregor-samsa"=>1, "woke"=>1})
    end
  end

  describe '#get_tf' do
    it 'returns the correct term frequency for a word' do
      test_term_frequency = @test_tf.get_tf('his')

      test_term_frequency.must_be_instance_of Float
      test_term_frequency.must_equal 0.06896551724137931
    end
  end

end
