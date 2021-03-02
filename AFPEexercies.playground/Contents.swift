import UIKit
import SwiftUI


// Activité Recap 1/mar/2021

struct Robot {
    var name: String
    
    func landing() -> Bool {
        print("\(self.name) is landing on Mars")
        return true
        // to land the Robot on the Mars
    }
    
    func departing() -> Bool {
        print("\(self.name) is departing from Mars")
        return false
        // to depart the Robot from the Mars
    }
    
    var drone: Drone = Drone(name: "myDrone")
}

struct Drone {
    var name: String
    
    mutating func start() {
        consumeBattery()
    }
    mutating func goUp() {
        consumeBattery()
    }
    mutating func goDown() {
        consumeBattery()
    }
    mutating func roll(_ directionLeftRight: DirectionLeftRight) {
        // Moves your drone left or right in the air, literally “rolling” your drone.
        print("Rolling to \(directionLeftRight)")
        consumeBattery()
    }
    mutating func pitch(_ directionForwardBackward: DirectionForwardBackward) {
        // Tilts your drone forward or backward.
        print("Tilts \(directionForwardBackward)")
        consumeBattery()
    }
    mutating func yaw(_ directionClockwiseCounterclockwise: DirectionClockwiseCounterclockwise) {
        // Rotates your drone clockwise or counterclockwise, allowing you to make circles or patterns in the air.
        print("Rotate \(directionClockwiseCounterclockwise.clockwiseCounterclockwise), angre: \(directionClockwiseCounterclockwise.radian) radian.")
        consumeBattery()
    }
    mutating func throttle(acceralate: Double) {
        // Controls the amount of power sent to your drone, which makes the drone go faster or slower.
        print("Accelerate \(acceralate) (m/s^2)")  // acceralate = distance(m)/(time(s)^2)
        consumeBattery()
    }
    
    enum DirectionLeftRight {
        case left, right
    }
    enum DirectionForwardBackward {
        case forward, backward
    }
    struct DirectionClockwiseCounterclockwise {
        var clockwiseCounterclockwise: DirectionLeftRight
        var radian: Double // 0 <= 6.28319
    }
    
    var numPicture: Int = 0
    mutating func incrementNumPicture() {
        numPicture += 1
    }
    
    mutating func takePicture() -> Image {
        let pictureImage: Image
        
        print("Took a picture. Picture no: \(numPicture)")
        pictureImage = Image(systemName: "picture")
        incrementNumPicture()
        consumeBattery()
        return pictureImage
    }
    mutating func recordSound(recordTimeSecond: Int) -> String {
        let recordedSound: String
        print("Recorded sound in \(recordTimeSecond) second")
        recordedSound = "soundString"
        //sleep(UInt32(recordTimeSecond))
        for _ in 0...recordTimeSecond {
            sleep(1)
            consumeBattery()
        }
        return recordedSound
    }
    mutating func meaureTemperature() -> Double {
        let measuredTemperature: Double
        print("Measured temperature")
        measuredTemperature = -20
        consumeBattery()
        return measuredTemperature
    }
    
    
    var batteryQuantity: Int = 100
    mutating func consumeBattery() {
        if batteryQuantity <= 5 {
            batteryQuantity = 0
            print("!!! \(self.name) has no battery!")
        } else {
            batteryQuantity -= 5
            switch batteryQuantity {
            case 6...20:
                print("Warning! Battery is low!")
            case 20...50:
                print("Notice. Battely getting low.")
            case 50...70:
                print("Enough battery.")
            default:
                break
            }
            
        }
    }
    
    func checkBattery() {
        //print("Battery remains \(battery.totalBattery) %")
        print("Battery remains \(batteryQuantity) %")
    }
    
}
extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}


var goldlake = Robot(name: "Goldlake", drone: Drone.init(name: "GoldlakeJr"))
var pictures: [Image] = []
var sounds: [String] = []
var temperatures: [Double] = []

let start = Date()
goldlake.landing()
print("Hello, my name is \(goldlake.name). I am a robot.")
print("Hello, my name is \(goldlake.drone.name). I am a drone of \(goldlake.name)")
temperatures.append(goldlake.drone.meaureTemperature())
pictures.append(goldlake.drone.takePicture())
pictures.append(goldlake.drone.takePicture())
pictures.append(goldlake.drone.takePicture())
pictures.append(goldlake.drone.takePicture())
goldlake.drone.checkBattery()
pictures.append(goldlake.drone.takePicture())
pictures.append(goldlake.drone.takePicture())
pictures.append(goldlake.drone.takePicture())
goldlake.drone.pitch(Drone.DirectionForwardBackward.forward)
goldlake.drone.yaw(Drone.DirectionClockwiseCounterclockwise(clockwiseCounterclockwise: Drone.DirectionLeftRight.left, radian: 3.15))
goldlake.drone.throttle(acceralate: 1.5)
temperatures.append(goldlake.drone.meaureTemperature())
sounds.append(goldlake.drone.recordSound(recordTimeSecond: 5))
goldlake.drone.checkBattery()
goldlake.departing()
let end = Date()
print("Total time to stay on Mars is: \(end - start)")
//print(temperatures)
