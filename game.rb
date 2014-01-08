=begin
pages_with_questions = {}

File.open("story.txt", "r") do |infile|
	while (line = infile.gets)
		if line.match /^~p\d$/
			pages_with_questions[line] = "this is page text"
		elsif line.match /^~p\d:c\d:p\d$/
			pages_with_questions[line] = "this is question text"
		end
	end
end

puts pages_with_questions
=end
#hash: keys = p1,p2 etc    values = text inbetween keys
#search for page num, add as key to hash
#search for next key, add all text between as value attributed to first key
#repeat until all text is accounted for in hash




#search for first marker (~p)
	# make that the first key in a hash
		#start adding the lines after that (using .gets) until the second marker is found




def start()

$keys_values = {}
grabbed_lines = ""
key = ""

File.open("story.txt") do |infile|
	while (line = infile.gets)
		if line.index("~p")
			key = line.chomp
			grabbed_lines = ""
		else
			grabbed_lines += line
		end
		$keys_values[key] = grabbed_lines
	end
end



p1 = $keys_values.select do|k,v| 
	k.index("~p1")
end


File.open("response.txt","w")

i = 0

puts "------------------------"
puts "\n\n"

p1.each do |key,value|
	if key.include?("c")
	puts "#{i}: #{value}"
	File.open("response.txt","a") {|f| f.write("#{i}: #{value}")}
	else
	puts value
	File.open("response.txt","a") {|f| f.write(value)}
	end

	i += 1
end

end

start()


user_input = gets.chomp.to_i



answer = $keys_values.select do |k,v|
	k.index("c#{user_input}")
end.keys[0]

final_answer = "~#{answer[-2..-1]}"
puts "You chose option #{user_input}\n\n"
puts $keys_values[final_answer]

File.open("response.txt","a") {|f| f.write("You chose option #{user_input}\n\n")}
File.open("response.txt","a") {|f| f.write($keys_values[final_answer])}



puts "Do you want to start over?"
start_over = gets.chomp.downcase
if start_over == "yes"
	start()
end

