//
//  ALBubbleSortView.swift
//  AnimatedAlgorithms
//
//  Created by Aamir  on 30/09/17.
//  Copyright © 2017 AamirAnwar. All rights reserved.
//

import UIKit

fileprivate let kInterBubbleSpacing:CGFloat = 8.0
fileprivate let kSidePadding:CGFloat = 8.0
fileprivate let animDuration:Double = 1

class ALBubbleSortView: AnimatedAlgorithmView, CAAnimationDelegate {

    var unsortedList:[Int] = [10,9,8,7,6,1,2,3,4,5]
    fileprivate var bubbleArray = [UILabel]()
    fileprivate var bubbleSize:CGFloat = 22
    fileprivate var currentIndex = 0
    fileprivate var didSwap = false

    override func didMoveToWindow() {
        super.didMoveToWindow()
        if self.superview != nil {
            createListBubbles(unsortedList: unsortedList)
        }
    }
    
    func createListBubbles(unsortedList:[Int]) -> Void {
        var x = kInterBubbleSpacing
        bubbleSize = (self.frame.width - 2*kSidePadding - CGFloat((unsortedList.count - 1) * Int(kInterBubbleSpacing)))/CGFloat(unsortedList.count)
        
        bubbleArray.forEach { (bubble) in
            bubble.removeFromSuperview()
        }
        bubbleArray.removeAll()
        
        for number in unsortedList {
            let bubble = UILabel()
            bubble.text = "\(number)"
            bubble.textColor = UIColor.white
            bubble.textAlignment = .center
            bubble.backgroundColor = UIColor.red.withAlphaComponent(0.6)
            bubble.layer.cornerRadius = bubbleSize/2
            bubble.layer.masksToBounds = true
            bubble.frame = CGRect(x: x, y: self.center.y - bubbleSize/2, width: bubbleSize, height: bubbleSize)
            x += bubbleSize + kInterBubbleSpacing
            self.addSubview(bubble)
            bubbleArray += [bubble]
            
        }
    }
    
    override func start() {
        bubbleSort()
    }
    
    func bubbleSort() {
        if unsortedList.count > currentIndex + 1 {
            if unsortedList[currentIndex] > unsortedList[currentIndex + 1] {
                didSwap = true
                swapBubble(atIndex: currentIndex, toIndex: currentIndex + 1)
            }
            else {
                currentIndex = currentIndex + 1
                bubbleSort()
            }
            
        }
        else {
            // If we performed a swap in the previous run, then reset and loop again from the start
            if didSwap == true {
                didSwap = false
                currentIndex = 0
                bubbleSort()
            }
        }
    }
    
    func swapBubble(atIndex i:Int, toIndex j:Int) {
        
        
        let fromBubble = bubbleArray[i]
        var (x,y) = (fromBubble.center.x, fromBubble.center.y)
        let fromBubbleAnimation = CAKeyframeAnimation(keyPath: "position")
        fromBubbleAnimation.duration = animDuration
        fromBubbleAnimation.values = [
            CGPoint(x: x, y: y),
            CGPoint(x: x, y: y - 50),
            CGPoint(x: x + kSidePadding + bubbleSize, y: y - 50),
            CGPoint(x: x + kSidePadding + bubbleSize, y: y),
            ].map{NSValue(cgPoint: $0)}
        fromBubbleAnimation.keyTimes = [0.25 ,0.5, 0.75 ,1.0]
        fromBubbleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        fromBubbleAnimation.delegate = self
        fromBubbleAnimation.setValue(i, forKey: "index")
        fromBubble.layer.add(fromBubbleAnimation, forKey: nil)
        fromBubble.layer.position =  CGPoint(x: x + kSidePadding + bubbleSize, y: y)
        
        
        let toBubble = bubbleArray[j]
        (x,y) = (toBubble.center.x, toBubble.center.y)
        let toBubbleAnimation = CAKeyframeAnimation(keyPath: "position")
        toBubbleAnimation.duration = animDuration/4
        toBubbleAnimation.beginTime = CACurrentMediaTime() + 0.5
        toBubbleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        toBubbleAnimation.values = [
            CGPoint(x: x, y: y),
            CGPoint(x: x - kSidePadding - bubbleSize, y: y)
            ].map{NSValue(cgPoint:$0)}

        toBubbleAnimation.keyTimes = [0.0, 1.0]
        toBubble.layer.add(toBubbleAnimation, forKey: nil)
        delay(0.5) {
            toBubble.layer.position = CGPoint(x: x - kSidePadding - self.bubbleSize, y: y)
        }

        swapElements(fromIndex: i, toIndex: j)
    }
    
    
    func swapElements(fromIndex:Int, toIndex:Int) {
        let temp = unsortedList[fromIndex]
        unsortedList[fromIndex] = unsortedList[toIndex]
        unsortedList[toIndex] = temp
        
        let tempBubble = bubbleArray[fromIndex]
        bubbleArray[fromIndex] = bubbleArray[toIndex]
        bubbleArray[toIndex] = tempBubble
        
    }
    
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard let index = anim.value(forKey: "index") as? Int else {
            return
        }
        currentIndex = index + 1
        bubbleSort()
    }
    
}
