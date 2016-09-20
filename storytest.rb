@story = ({title: "Test Story #8", content: "First line\r\nSecond Line\r\nThird Line"})
@split_story = @story[:content].split /[\r\n]+/
@split_story.each do |para|
  p para
end

puts "Add to the story"
edit = gets.chomp

@story[:content] = @story[:content] + "\r\n"+ edit

p @story[:content]
