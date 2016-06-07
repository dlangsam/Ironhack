puts "What is the source file?"
source_file = gets.chomp
source_file_contents = IO.read(source_file)
puts "What is the destination file?"
destination_file = gets.chomp
IO.write(destination_file, source_file_contents)