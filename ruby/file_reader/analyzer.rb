stopwords = %w{the a by on for of are with just but and to the my I has some in}
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

total_characters = text.length
total_characters_no_spaces = text.gsub(/\s+/, "").length
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length
words = text.scan(/\w+/)
keywords = words.select { |word| !stopwords.include?(word) }
percent_interesting_words = ((keywords.length.to_f / words.length.to_f) * 100).to_i
sentences = text.gsub(/\s+/, " ").strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }


puts "#{line_count} lines."
puts "#{total_characters} characters."
puts "#{total_characters_no_spaces} characters, excluding spaces."
puts "#{word_count} words."
puts "#{sentence_count} sentences."
puts "#{paragraph_count} paragraphs."
puts "#{word_count / sentence_count} average words per sentence."
puts "#{sentence_count / paragraph_count} average sentences per paragraph."
puts "#{percent_interesting_words}% interesting words"
puts "Summary:\n\n #{ideal_sentences.join(". ")}"
puts "-- End of analysis"