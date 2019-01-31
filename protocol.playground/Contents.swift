import UIKit

protocol FeedDelegate {
    func refillWaterBowl()
}

struct Owner: FeedDelegate {
    func refillWaterBowl() {
        print("bowl is filled with water yay")
    }
}

struct Pet {
    var delegate: FeedDelegate? //delegating the task
}

var ruhsane = Owner()
ruhsane.refillWaterBowl()

var Benny = Pet()
Benny.delegate = ruhsane
Benny.delegate?.refillWaterBowl()
