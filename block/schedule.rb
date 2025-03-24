require "date"
class Schedule

  attr_reader :name, :sessions

  def initialize(name)
    @name = name
    @sessions = []
    yield(self) if block_given? # Cho phep truyen block khi khoi tao
  end

  def add_session(name, time:, room:, teacher:)
    start_time, end_time = time.split("-")
    start_time_convert = DateTime.parse(start_time).strftime("%H:%M")
    end_time_convert = DateTime.parse(end_time).strftime("%H:%M")

    @sessions << {name: name, time: start_time_convert + "-" + end_time_convert, room: room, teacher: teacher}
  end


  def print_schedule
    if(@sessions.empty?)
      puts "Schedule is empty"
    else

      sorted_sessions = @sessions.sort_by { |session| session[:time] }

      sorted_sessions.each do |session|
        puts "#{session[:name]} - #{session[:time]} - #{session[:room]} - #{session[:teacher]}"
      end
    end
  end
end

schedule = Schedule.new("Lịch học Ruby") do |s|
  s.add_session "Ruby nâng cao", time: "13:00-15:00", room: "A1.02", teacher: "Trần Thị B"
  s.add_session "Ruby cơ bản", time: "9:00-11:00", room: "A1.01", teacher: "Nguyễn Văn A"
  s.add_session "Rails cơ bản", time: "15:30-17:30", room: "A1.03", teacher: "Lê Văn C"
end

schedule.print_schedule