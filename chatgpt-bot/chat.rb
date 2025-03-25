require_relative "lib/chatgpt/cli"


puts "🤖 Chào mừng bạn đến với ChatGPT CLI!"

loop do

  print "👤 Bạn: "
  input = gets.chomp.strip

  break if input.downcase == "exit"

  puts "🤖 ChatGPT: "
  Chatgpt::Cli.ask(input)
end

puts "💡 Chat đã kết thúc."
