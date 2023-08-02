#!/usr/bin/env ruby

# Extract the first argument from the command line
input_string = ARGV[0]

# Define the specified strings to match
valid_strings = ["hbn", "hbtn", "hbttn", "hbtttn", "hbttttn"]

# Check if the input string is one of the specified strings
matches = valid_strings.select { |str| str == input_string }

# Join the matches into a single string and print the result
puts matches.join("\n")
