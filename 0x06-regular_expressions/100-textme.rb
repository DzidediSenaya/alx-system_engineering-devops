#!/usr/bin/env ruby

# Extract the log line from the command line
log_line = ARGV[0]

# Define the regular expression using Oniguruma to match the required information
regex = /\[from:([^]]+)\] \[to:([^]]+)\] \[flags:([^]]+)\]/

# Use the 'match' method to find the matches in the log line
match = log_line.match(regex)

# Extract the sender, receiver, and flags data from the matches
sender = match[1]
receiver = match[2]
flags = match[3]

# Print the extracted information in the desired format
puts "#{sender},#{receiver},#{flags}"

