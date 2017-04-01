//: [Previous](@previous)

let cars = [🚗, 🚕, 🚙, 🚌, 🚎, 🏎, 🚓]
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
    .reduce(0, max)

//: [Next](@next)
