require 'cgi'

raw_string = gets.chomp!
escaped_string = CGI.escapeHTML raw_string
puts escaped_string