def pretty_print(list)
  puts "\n"
  printf("%-20s %-30s %-30s\n", "word", "document", "term frequency")
  list.each do |entry|
    printf("%-20s %-30s %-30s\n", entry[0], entry[1], entry[2])
  end
end
