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
        
    }
}
