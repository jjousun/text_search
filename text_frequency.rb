class TextFrequency
  attr_reader :text, :word

  # Initializes state with an array of local texts' names
  def initialize(text)
    @text = text
  end

  # Returns an array of only words from a text
  def clean_up_text
    # rubular regex: http://rubular.com/r/tlSIhrlKD3
    cleaned_text = File.open(text,"r").read.downcase.scan(/[’']?\b[a-zA-Z]+(?:[’'-][a-zA-Z]+)*\b[’']?/)

    return cleaned_text
  end

  # Returns the total count of words in a text
  def total_words
    return clean_up_text.size
  end

  # Returns a hash of each word's frequency in the text
  def words_frequencies
    word_count = {}
    clean_up_text.each do |word|
      if word_count[word]
        word_count[word] += 1
      else word_count[word] = 1
      end
    end

    return word_count
  end

  # Returns the term frequency for a word
  def get_tf(word)
    term_frequency = (words_frequencies[word].to_f)/total_words

    return term_frequency
  end
end
