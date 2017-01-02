//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

//https://www.shinobicontrols.com/blog/ios-10-day-by-day-day-4-uiviewpropertyanimator

public class EventListener: NSObject {
    public var eventFired: (() -> ())?
    
    public func handleEvent() {
        eventFired?()
    }
}

// Container for our animating view
let containerView = NinjaContainerView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

let ninja = containerView.ninja

// Show the container view in the Assistant Editor
PlaygroundPage.current.liveView = containerView

// First easy approach
//UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
//    containerView.moveNinjaToBottomRight()
//    }.startAnimation()

// Second approach
//let animator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut)
//
//animator.addAnimations {
//    containerView.moveNinjaToBottomRight()
//}
//
//animator.addAnimations {
//    ninja.alpha = 0
//}
//Only happens once
//animator.startAnimation()
//
//animator.addCompletion {
//    _ in
//    print("Animation completed")
//}
//
//animator.addCompletion {
//    position in
//    switch position {
//    case .end: print("Completion handler called at end of animation")
//    case .current: print("Completion handler called mid-way through animation")
//    case .start: print("Completion handler called  at start of animation")
//    }
//}

//animator.startAnimation()


// Scrubbing and Reversing
// Using elements to move and display

//let animator2 = UIViewPropertyAnimator(duration: 5, curve: .easeIn)
//// Add our first animation block
//animator2.addAnimations {
//    containerView.moveNinjaToBottomRight()
//}
//
//let scrubber = UISlider(frame: CGRect(x: 0, y: 0, width: containerView.frame.width, height: 50))
//containerView.addSubview(scrubber)
//
//
//let eventListener = EventListener()
//eventListener.eventFired = {
//    animator2.fractionComplete = CGFloat(scrubber.value)
//}
//
//scrubber.addTarget(eventListener, action: #selector(EventListener.handleEvent), for: .valueChanged)


//animator2.startAnimation()


let animator3 = UIViewPropertyAnimator(duration: 5, curve: .easeIn)
animator3.addAnimations {
    UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [.calculationModeCubic], animations: {
        UIView.addKeyframe(withRelativeStartTime: 0,  relativeDuration: 0.5) {
            ninja.center = containerView.center
        }
        UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
            containerView.moveNinjaToBottomRight()
        }
    })
}

let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 30)))
button.setTitle("Reverse", for: .normal)
button.setTitleColor(.black, for: .normal)
button.setTitleColor(.gray, for: .highlighted)
let listener = EventListener()
listener.eventFired = {
    animator3.isReversed = true
}

button.addTarget(listener, action: #selector(EventListener.handleEvent), for: .touchUpInside)
containerView.addSubview(button)

animator3.startAnimation()













