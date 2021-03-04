import UIKit

protocol ButtonDelegate {
    func userTappedButton(_ button: Button)
}

class Button {
    let title: String
    var delegate: ButtonDelegate?
    
    init(title: String) {
        self.title = title
    }
    
    func tapped() {
        self.delegate?.userTappedButton(self)
    }
}

class GameController: ButtonDelegate {
    
    func userTappedButton(_ button: Button) {
        print("User tapped the \(button.title) button.")
    }
}

let startButton = Button(title: "Start")
let gameController = GameController()
startButton.delegate = gameController

startButton.tapped()

class Song {
    let title: String
    let player: String
    
    init(title:String, player:String) {
        self.title = title
        self.player = player
    }
}




class MusicController: ButtonDelegate {
    var aSong: Song
    init(aSong: Song) {
        self.aSong = aSong
    }
    
    func playSong(_ song: Song) {
        print("Now playing: \(song.title)")
    }
    
    func pauseSong() {
        print("Pause current song.")
    }
    
    func userTappedButton(_ button: Button) {
        if button.title == "Play" {
            playSong(aSong)
        } else if button.title == "Pause" {
            pauseSong
        }
    }

}

let mySong = Song(title: "My way", player: "Sinatra")
let musicController = MusicController(aSong: mySong)
let startMusicButton = Button(title: "Play")
let stopMusicButton = Button(title: "Pause")

startMusicButton.delegate = musicController
stopMusicButton.delegate = musicController
musicController.playSong(mySong)
musicController.pauseSong()


protocol HeartRateReceiverDelegate {
    func heartRateUpdated(to bpm: Int)
}

class HeartRateReceiver {
    var delegate: HeartRateReceiverDelegate?
    var currentHR: Int? {
        didSet {
            if let currentHR = currentHR {
                delegate?.heartRateUpdated(to: currentHR)
                print("Recent heart rate is \(currentHR)")
            } else {
                print("we cannot pick up you heart rate")
            }
        }
    }
    
    func startHeartRateMonitoringExample() {
        for _ in 1...10 {
            let randomHR = Int(arc4random_uniform(UInt32(130)))
            currentHR = randomHR
            Thread.sleep(forTimeInterval: 2)
        }
    }
}

class HeartRateViewController: UIViewController, HeartRateReceiverDelegate {
    func heartRateUpdated(to bpm: Int) {
        heartRateLabel.text = "\(bpm)"
        print("The user has been shown a heart rate of <\(bpm)>.")
    }
    
    var heartRateLabel: UILabel = UILabel()
   
}

let myHeartRateReceiver = HeartRateReceiver()
let myHeartRateViewControler = HeartRateViewController()

//myHeartRateReceiver.startHeartRateMonitoringExample()
//myHeartRateReceiver.currentHR

myHeartRateReceiver.delegate = myHeartRateViewControler
myHeartRateReceiver.startHeartRateMonitoringExample()
