loop do
	# Converts hours, minutes, and seconds to their own binary arrays
	secs = Time.now
	bin_hours_array = secs.hour.to_s(2).chars.to_a
	bin_mins_array = secs.min.to_s(2).chars.to_a
	bin_secs_array = secs.sec.to_s(2).chars.to_a

	# Blank clock array			 
	clock_array = [['   ','[ ]',' ','   ','[ ]',' ','   ','[ ]'],
			    ['   ','[ ]',' ','   ','[ ]',' ','   ','[ ]'],
			    ['   ','[ ]',' ','[ ]','[ ]',' ','[ ]','[ ]'],
			    ['[ ]','[ ]',' ','[ ]','[ ]',' ','[ ]','[ ]']]

	# Adds the current hours to the clock array
	x, y = 3, 1	
	bin_hours_array.reverse.each do |i|
		clock_array[x][y] = i == '1' ? '[|]' : '[ ]'
		y = x == 0 ? y - 1 : y
		x = x == 0 ? 3 : x - 1
	end

	# Adds the current minutes to the clock array
	x, y = 3, 4
	bin_mins_array.reverse.each do |i|
		clock_array[x][y] = i == '1' ? '[|]' : '[ ]'
		y = x == 0 ? y - 1 : y
		x = x == 0 ? 3 : x - 1
	end

	# Adds the current seconds to the clock array
	x, y = 3, 7
	bin_secs_array.reverse.each do |i|
		clock_array[x][y] = i == '1' ? '[|]' : '[ ]'
		y = x == 0 ? y - 1 : y
		x = x == 0 ? 3 : x - 1
	end

	# Draws the populated clock array
	system('cls') # Only works on Windows
	clock_array.each { |row| puts row.join("") }

	# Adds a human-readable digital clock below the binary clock
	digital = secs.strftime("%H%M%S")
	puts "\n " + digital[0] + '  ' + digital[1] + ' : ' + \
	digital[2] + '  ' + digital[3] + ' : ' + digital[4] + '  ' + digital[5]
	
	# Limits re-draw to every new second
	sleep 1
end