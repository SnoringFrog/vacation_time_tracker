#!/usr/bin/env ruby

require 'date'
require 'colored'

vacation_days = Array.new()
days_taken = Array.new()

# Strings used for output
top_string="▄  "
bottom_string= "▀  "

class VacationDay
	@@days_remaining=20 # replace with something that calculates how many days off I have
	@@days_taken=0
	@@days_planned=0

	def initialize(date, length, reason)
		@date = date
		@length = length
		@reason = reason

		@@days_remaining -= @length

		if @date < Date.today
			@@days_taken += @length
		else
			@@days_planned += @length
		end	
	end

	def self.days_remaining
		@@days_remaining
	end

	def self.days_taken
		@@days_taken
	end

	def self.days_planned
		@@days_planned
	end
end

year=2016
days_taken[year] = [
	[Date.new(year,3,1), 0.5, "Bullet for My Valentine in Silver Spring"],
	[Date.new(year,3,18), 0.5, "Zao in Pittsburgh"],
	[Date.new(year,4,4), 1, "Iron Maiden in MI"],
	[Date.new(year,4,5), 1, "Iron Maiden in MI"],
	[Date.new(year,4,6), 1, "Iron Maiden in MI"],
	[Date.new(year,4,22), 0.5, "Underoath in Charlotte"],
	[Date.new(year,6,10), 0.5, "Ellie Goulding in Raleigh (leading into Thrice in Charlotte)"],
	[Date.new(year,8,5), 0.5, "Walk the Moon in Raleigh"],
	[Date.new(year,12,27), 1, "Christmas"],
	[Date.new(year,12,28), 1, "Christmas"],
	[Date.new(year,12,29), 1, "Christmas"],
	[Date.new(year,12,30), 1, "Christmas"],
]

year=2015
days_taken[year] = [ 
	[Date.new(year,3,10), 0.5, "TLB in VBA"],
	[Date.new(year,3,27), 0.5, "Quadruple CD release in MD"],
	[Date.new(year,4,9), 0.5, "TLB in Philly, NYC"],
	[Date.new(year,4,10), 1, "TLB in Philly, NYC"],
	[Date.new(year,5,4), 0.5, "After Carolina Rebellion"],
	[Date.new(year,5,14), 0.5, "Nightwish MD, Kublai Khan Richmond, Skate N Surf NJ"],
	[Date.new(year,5,15), 1, "Nightwish MD, Kublai Khan Richmond, Skate N Surf NJ"],
	[Date.new(year,5,18), 0.5, "Nightwish MD, Kublai Khan Richmond, Skate N Surf NJ"],
	[Date.new(year,5,26), 1, "Anna's Wedding"],
	[Date.new(year,6,26), 0.5, "Comrades/Household in OH"],
	[Date.new(year,7,31), 1, "ACB in New Orleans"],
	[Date.new(year,9,14), 1, "Courtney was sick"],
	[Date.new(year,10,16), 1, "Comeback Kid and Mayday Parade"],
	[Date.new(year,10,19), 0.5, "Comeback Kid and Mayday Parade"],
	[Date.new(year,11,2), 0.5, "Blind Guardian in Philly"],
	[Date.new(year,11,6), 0.5, "Copeland in Carrboro"],
	[Date.new(year,11,16), 0.5, "All Time Low in DC"],
	[Date.new(year,12,10), 0.5, "Woke up super late"],
	[Date.new(year,12,14), 1, "Jacksonville, FL"],
	[Date.new(year,12,15), 1, "Jacksonville, FL"],
	[Date.new(year,12,16), 1, "General day off"],
	[Date.new(year,12,17), 1, "General day off"],
	[Date.new(year,12,18), 1, "General day off"],
	[Date.new(year,12,21), 1, "Christmas"],
	[Date.new(year,12,22), 1, "Christmas"],
	[Date.new(year,12,23), 1, "Christmas"],
]

check_year = ARGV[0] != nil ? ARGV[0].to_i : Date.today.strftime("%Y").to_i
for day in days_taken[check_year]
	vacation_days.push(VacationDay.new(day[0], day[1], day[2]))
end

#puts "Vacation days taken: " + VacationDay.days_taken.to_s
#puts "Vacation days planned: " + VacationDay.days_planned.to_s
#puts "Unplanned/Untaken: " +VacationDay.days_remaining.to_s

boxes_top, boxes_bottom = "",""

boxes_top+= top_string.red*VacationDay.days_taken.ceil
boxes_bottom+= bottom_string.red*VacationDay.days_taken.floor

if VacationDay.days_taken%1 == 0
	boxes_top+= top_string.yellow*VacationDay.days_planned.ceil
	boxes_bottom+= bottom_string.yellow*VacationDay.days_planned.floor
else
	boxes_top+= top_string.yellow*VacationDay.days_planned.floor
	boxes_bottom+= bottom_string.yellow*VacationDay.days_planned.ceil
end

if VacationDay.days_remaining%1 == 0
	boxes_top+= top_string.green*VacationDay.days_remaining.ceil
	boxes_bottom+= bottom_string.green*VacationDay.days_remaining.floor
else
	boxes_top+= top_string.green*VacationDay.days_remaining.floor
	boxes_bottom+= bottom_string.green*VacationDay.days_remaining.ceil
end

puts boxes_top
puts boxes_bottom
puts "1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20"

#┌┐▄
#└┘▀
