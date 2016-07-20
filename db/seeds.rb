# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Client.create(name: 'Dariana Barrios', email: 'dariana.barrios@gmail.com', phone: '4162007371', cedula: 20555621)
#Client.create(name: 'Simon Tang', email: 'simon.tang.arias@gmail.com', phone: '4162007371', cedula: 17884036)


# a = Car.create(make:"Ford", model: 'Focus', year: '01/01/2008', color: 'black', plate: 'A2E563G', client_id: 1)
# b = Car.create(make:"Toyota", model: 'A4', year: '01/01/2005', color: 'silver', plate: 'B2E11W2', client_id: 1)
# c = Car.create(make:"Lincon", model: 'A4', year: '01/01/2005', color: 'orange', plate: 'B2E16W2', client_id: 3)
# d = Car.create(make:"Cadillac", model: 'A4', year: '01/01/2005', color: 'grey', plate: 'B2E15W2', client_id: 4)
# e = Car.create(make:"Chevrolet", model: 'A4', year: '01/01/2005', color: 'white', plate: 'B2E1uW2', client_id: 5)
#
# Job.create(car_id: a.id, mechanic_id: 1)
# Job.create(car_id: b.id, mechanic_id: 2)
# Job.create(car_id: c.id, mechanic_id: 1)

#Job.create(car_id: 18, mechanic_id: 1, aasm_state: 'completed')

Status.create(message: 'hola', current_state: 'hola2', job_id: 3)
