require "socket"

server = "chat.freenode.net"

port = "6667"

nick = "Peter_Parker_2013_08_"

channel = "#bitmaker"


greeting_prefix = "privmsg #bitmaker:"

greetings = ["hi spidey"]

irc_server = TCPSocket.open(server, port)


irc_server.puts "User bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"


#irc_server.puts "PRIVMSG" #{channel}:  Hello from IRB Bot"

# Hello, Bot!

until irc_server.eof? do 

	msg= irc_server.gets.downcase
	puts msg

	wasGreeted = false
	greetings.each { |g| wasGreeted = true if msg.include? g }


	if msg.include? greeting_prefix and was wasGreeted
		response = "My spider-sense is tingling"
		irc_server.puts "PRIVMSG #{channel} :#{response}"
	end
end


