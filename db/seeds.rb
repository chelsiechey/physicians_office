# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
specialties = ['Family Medicine', 'Internal Medicine', 'Pediatrics', 'Surgery', 'Psychiatry', 'Cardiology', 'Dermatology', 'Endocrinology', 'Gastroenterology', 'Neurology', 'Gynecology']
times = ['0800', '0900', '1000', '1100', '1200', '1300', '1400', '1500']
10.times do 
  physician = Physician.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    specialty: specialties.sample
  )
  10.times do
    patient = Patient.create(
      first_name: Faker::Name.first_name,  
      last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email
    )

    Appointment.create(
      date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
      time: times.sample,
      physician_id: physician.id,
      patient_id: patient.id
    )
  end
end

puts 'Data seeded.'