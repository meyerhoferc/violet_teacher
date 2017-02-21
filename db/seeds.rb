require 'faker'

subjects = ["Science", "Math", "Literature", "Social Studies", "Art"]
subjects.each { |subject| Subject.create!(name: subject) }

5.times do
  Student.create!(name: Faker::HarryPotter.character,
                  grade: Faker::Number.number(1),
                  username: Faker::Lorem.word,
                  password: Faker::HarryPotter.location)
end

Teacher.create!(name: "George", username: "root", password: "toor", department: "science")
Student.create!(name: "Bob", username: "root", password: "toor", grade: 10)

teacher = Teacher.find_by(username: "root")
course1 = teacher.courses.create!(title: "physics",
                        description: "learn things",
                        subject: Subject.first,
                        location: "B100")
course2 = teacher.courses.create!(title: "chemistry",
                        description: "learn things",
                        subject: Subject.first,
                        location: "B100")
course3 = teacher.courses.create!(title: "biology",
                        description: "learn things",
                        subject: Subject.first,
                        location: "B100")
Student.all.each do |student|
  Enrollment.create!(course: course1, student: student)
  Enrollment.create!(course: course2, student: student)
  Enrollment.create!(course: course3, student: student)
end

Course.all.each do |course|
  Assignment.create!(title: Faker::Food.ingredient,
                     point_value: Faker::Number.number(2),
                     course: course)
  Assignment.create!(title: Faker::Food.ingredient,
                     point_value: Faker::Number.number(2),
                     course: course)
end
