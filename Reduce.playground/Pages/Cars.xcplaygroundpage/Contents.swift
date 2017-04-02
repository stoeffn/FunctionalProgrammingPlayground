//: [Previous](@previous)

let cars = [🚗, 🚕, 🚙, 🚌, 🚎, 🏎]
//#-hidden-code
    .visualized
//#-end-hidden-code

//#-editable-code
//#-copy-source(code)
let electricCars = cars
    .filter { car in car.isElectric }

var maximumElectricCarSpeed = 0
for car in cars {
    if car.isElectric {
        let speed = car.maxSpeed
        maximumElectricCarSpeed = max(speed, maximumElectricCarSpeed)
    }
}

let maxElectricCarSpeed = cars
    .filter { $0.isElectric }
    .map { $0.maxSpeed }
    .max()

electricCars == [🚗, 🚙, 🚎]

let speeds = cars
    .filter { $0.isElectric }
    .map { $0.maxSpeed }

speeds == [225, 210, 120]
speeds.description
speeds.description == "[225, 210, 120]"

//: [Next](@next)
