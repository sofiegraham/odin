file_name = "wiki.html"
f = File.open(file_name, "r+")
puts f.gets
f.puts "This is baller"
puts f.gets
f.close

f = File.open(file_name, "r+")
f.putc "H"
f.puts "WHAT BOUT DIS"
f.putc "H"
f.putc "J"
f.write "BILLYBOB"
f.close

puts File.open(file_name, "r").external_encoding


puts File.expand_path(file_name) #Show absolute file path

f = File.new(file_name, "r+")
f.seek(-5, IO::SEEK_END) #Move 'position' to -5 from end of file.
f.putc "X"
f.close

puts "It exists!" if File.exist?(file_name)

puts File.size(file_name)

require 'csv'
require 'sqlite3'
puts "cool" if defined?(SQLite3::Database)