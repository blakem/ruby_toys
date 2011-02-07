#!/usr/bin/env ruby
puts "Which strategy do you want to use? "
puts "  (1) Always switch Doors"
puts "  (2) Never switch Doors"

strategy = gets.chomp

print "You chose: "
if strategy == "1"
  puts "Always Switch"
elsif strategy == "2"
  puts "Never Switch"
else 
  puts "Something else"
  exit
end

puts "How many trials do you want to run? "

count = gets.chomp.to_i

puts "Running #{count} trials:"

wins = 0

(1..count).each do 
  prize = rand(3)
  pick = rand(3)
  
  puts "Prize = #{prize}"
  puts "Pick = #{pick}"
  doors = [0,1,2]
  doors.delete(prize)
  doors.delete(pick)
  reveal = doors[rand(doors.length)]
  puts "Reveal: #{reveal}"
  
  doors = [0,1,2]
  doors.delete(pick)
  doors.delete(reveal)
  other_door = doors[0]
  puts "Other Door #{other_door}"

  if strategy == "1"
    puts "You chose to switch to door #{other_door}"
    pick = other_door
  else 
    puts "You are sticking with door #{pick}"
  end
  
  puts "FinalPick = #{pick} : Prize = #{prize}"
  
  if pick == prize
    puts "You Win!"
    wins = wins+1
  else
    puts "You Lose"
  end
  
  puts
end

  puts "You won #{wins} out of #{count}"
  
