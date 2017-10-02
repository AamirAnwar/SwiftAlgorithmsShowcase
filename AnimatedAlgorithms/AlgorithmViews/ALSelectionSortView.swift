//
//  ALSelectionSortView.swift
//  AnimatedAlgorithms
//
//  Created by Aamir  on 30/09/17.
//  Copyright © 2017 AamirAnwar. All rights reserved.
//

import UIKit

class ALSelectionSortView: AnimatedAlgorithmView {
    var unsortedList:[Int] = Helpers.getUnsortedList()
    fileprivate var bubbleSize:CGFloat = 22
    fileprivate var bubbles:[UILabel] = []
    fileprivate var sortedEndPosition = -1
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        (bubbles, bubbleSize) = Helpers.createListBubbles(unsortedList:unsortedList , view: self)
        
    }
    
    override func start() {
        selectionSort()
    }
    
    func selectionSort() {
        if sortedEndPosition < unsortedList.count - 1 {
            let subarray = unsortedList[sortedEndPosition+1..<unsortedList.count]
            if let min = subarray.min(), let minPosition = subarray.index(of: min) {
                swapElement(atIndex: sortedEndPosition + 1, withElementAtIndex: minPosition)
                sortedEndPosition += 1
            }
        }
    }
    
    func swapElement(atIndex i:Int, withElementAtIndex j:Int) {
        let fromBubble = bubbles[i]
        let toBubble = bubbles[j]
        let temp = fromBubble.frame
        
        UIView.animate(withDuration: 1, animations: {
            fromBubble.frame = toBubble.frame
            toBubble.frame = temp
        }) { (_) in
            self.unsortedList.swapAt(i, j)
            self.bubbles.swapAt(i, j)
            self.selectionSort()
        }
    }
}
