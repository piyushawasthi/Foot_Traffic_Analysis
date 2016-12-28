require './lib/room.rb'
require './lib/visit.rb'
require './lib/log_file.rb'
require './lib/foot_traffic_analysis.rb'

puts "Sample Input 1 "
File.open("#{Dir.pwd}/input/input1.txt", "r").each_line do |line|
  puts line
end

traffic_analysis = FootTrafficAnalysis.new(LogFile.new("#{Dir.pwd}/input/input1.txt"))
traffic_analysis.print_report(1)

puts "Sample Input 2 "
File.open("#{Dir.pwd}/input/input2.txt", "r").each_line do |line|
  puts line
end
traffic_analysis.logfile = LogFile.new("#{Dir.pwd}/input/input2.txt")
traffic_analysis.print_report(2)
