//
//  Commons.swift
//  AnimatedAlgorithms
//
//  Created by Aamir  on 30/09/17.
//  Copyright © 2017 AamirAnwar. All rights reserved.
//

import Foundation
import UIKit

let kListPageHeading = "List"
let kInterBubbleSpacing:CGFloat = 8.0
let kSidePadding:CGFloat = 8.0
let kShowAnimationDetailSegueIdentifier = "ShowAnimationDetail"

func delay(_ seconds: Double, completion: @escaping ()->Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(Int(seconds * 1000.0))) {
        completion()
    }
}

protocol AnimatedAlgorithm {
    func start()
}

class AnimatedAlgorithmView:UIView, AnimatedAlgorithm {
    func start() {
        fatalError("Start function not implemented")
    }
}

enum Helpers {
    
    @discardableResult
    static func createListBubbles(unsortedList:[Int], view:AnimatedAlgorithmView) -> (bubbles:[UILabel], bubbleSize:CGFloat) {
        var bubbleArray = [UILabel]()
        var bubbleSize:CGFloat = 22
        var x = kInterBubbleSpacing
        bubbleSize = (view.frame.width - 2*kSidePadding - CGFloat((unsortedList.count - 1) * Int(kInterBubbleSpacing)))/CGFloat(unsortedList.count)
        
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
            bubble.frame = CGRect(x: x, y: view.center.y - bubbleSize/2, width: bubbleSize, height: bubbleSize)
            x += bubbleSize + kInterBubbleSpacing
            view.addSubview(bubble)
            bubbleArray += [bubble]
            
        }
        return (bubbleArray, bubbleSize)
    }
    
    static func getUnsortedList() -> [Int] {
        return [10,9,8,7,6,1,2,3,4,5]
    }
}




