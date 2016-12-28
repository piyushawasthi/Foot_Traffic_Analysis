class FootTrafficAnalysis

  attr_accessor :logfile

  def initialize(logfile)
    @logfile = logfile
  end

  def print_report(num)
    puts "\nSample Output #{num}\n\n"
    results = room_visit_info
    order_by_room(results)
    puts "====================================================="
  end

  private

  def order_by_room(results)
    results.keys.sort.each do |row|
      puts results[row]
    end
  end

  def room_visit_info
    results = {}
    room_wise_visitors_group.each do |room_id, visit|
      results[room_id.to_i] = Room.new(visit).print_info
    end
    results
  end

  def room_wise_visitors_group
    visitors_log.group_by{|visit| visit.room}
  end

  def visitors_log
    visitors = input_lines.collect do |line|
      data = line.split
      Visit.new(data[0], data[1], data[2], data[3])
    end
    visitors
  end

  def input_lines
    logfile.get_lines
  end

end