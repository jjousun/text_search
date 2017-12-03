require_relative 'text_frequency'
require_relative 'pretty_print'

docs = ['mobydick-chapter1.txt', 'mobydick-chapter2.txt', 'mobydick-chapter3.txt', 'mobydick-chapter4.txt', 'mobydick-chapter5.txt']
words = ['queequeg', 'whale', 'sea']

# Find the highest TF for a word
result = []
words.each do |word|
  max_tf = 0.0
  max_doc = ""
  docs.each do |doc|
    current_tf = TextFrequency.new(doc).get_tf(word)
    if current_tf > max_tf
      max_tf = current_tf
      max_doc = doc
    end
  end
  result << [word, max_doc, max_tf]
end

pretty_print(result)
