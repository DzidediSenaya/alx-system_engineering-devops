#!/usr/bin/env ruby

# Extract the first argument from the command line
input_string = ARGV[0]

# Define the regular expression using Oniguruma to match a 10-digit phone number
regex = /^\d{10}$/

# Use the 'match' method to check if the regex matches the entire input string
match = input_string.match(regex)

# Check if there is a match and print the result
puts match ? match[0] : ""

