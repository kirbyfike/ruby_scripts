# script parses through rows of data and outputs the day or soccer team with the smallest difference


# either set file_type to "w_data" or "soccer"
file_type = "soccer"


# initialize our variables
smallest_id = ""

# setting this to a large number knowing it will be ok with the data were working with
smallest_difference = 100000

diff_1 = 0
diff_2 = 0


# loop through the file that is given to us
File.open(file_type + ".dat").each do |line|
	
	# trim the whitespace on the string and split each column (1 or more spaces = a column)
	split_line = line.strip!.split(/\s+/)
	
	
	# if the first column is nil or the string is not numeric (use regex to remove all non numbers, then check if it's empty), ignore the row
	if !split_line[0].nil? && !split_line[0].gsub(/[^0-9]/, '').empty?

		# if its the weather data, set vars accordingly
		if (file_type == "w_data")

			diff_1 = split_line[1]
			diff_2 = split_line[2]
		
		# if its the soccer data, set vars accordingly
		elsif (file_type == "soccer")

			diff_1 = split_line[6]
			diff_2 = split_line[8]
		end
		

		# convert the columns to ints and get the difference
		current_difference = diff_1.to_i - diff_2.to_i

		# get the absolute value of the difference (in case the right is large than the left - for the soccer file)
		current_difference = current_difference.abs


		# if the current difference is smaller than the smallest difference, then output
		if (smallest_difference > current_difference)

			# set the correct id
			smallest_id = (file_type == "w_data") ? split_line[0] : split_line[1]

			# set the current diff to the smallest diff
			smallest_difference = current_difference
		end
		
	end
	
end

puts smallest_id