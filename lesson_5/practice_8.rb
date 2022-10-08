#Chapter 5, practice problem #8

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = ['a','e','i','o','u']

hsh.each do |key,value|
    value.each do |word|
      word.chars.each do |char|
        if vowels.include?(char)
          puts char
        end
      end
  end
end