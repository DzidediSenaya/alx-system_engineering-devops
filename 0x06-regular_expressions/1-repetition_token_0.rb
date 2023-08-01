#!/usr/bin/env ruby

# Extract the first argument from the command line
input_string = ARGV[0]

# Define the regular expression using Oniguruma to match the specified strings
regex = /hb+t+n/

# Use the 'scan' method to find all occurrences of the regex in the input string
matches = input_string.scan(regex)

# Join the matches into a single string and print the result
puts matches.join(" ")

