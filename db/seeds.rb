require 'faker'
 
Student.destroy_all
Course.destroy_all
Teacher.destroy_all


10.times do |index|
  Teacher.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
end

Teacher.all.each do |t|
  time_start = Faker::Time.between(Date.new(2019,1,1), Date.new(2019,12,31), :day)
  if time_start.sunday?
    time_start += 1.day
  elsif time_start.saturday?
    time_start -= 1.day
  end
  time_end = time_start + 2.hours
  day_name = Date::DAYNAMES[time_start.wday]
  
  Course.create!(subject: Faker::Educator.course, day_of_week:day_name, time_start:time_start, time_end:time_end, teacher:t)
  Course.create!(subject: Faker::Educator.course, day_of_week:day_name, time_start:time_start, time_end:time_end, teacher:t)
end

Course.all.each do |c|
  Student.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, course:c)
  Student.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, course:c)
end
