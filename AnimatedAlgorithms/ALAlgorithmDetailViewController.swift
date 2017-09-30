//
//  ALAlgorithmDetailViewController.swift
//  AnimatedAlgorithms
//
//  Created by Aamir  on 23/09/17.
//  Copyright © 2017 AamirAnwar. All rights reserved.
//

import UIKit

class ALAlgorithmDetailViewController: UIViewController, CAAnimationDelegate {
    var sortingView:ALBubbleSortView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sortingView = ALBubbleSortView(frame: view.bounds)
        sortingView.unsortedList = [1,5,7,3,2,9,4,10]
        view.addSubview(sortingView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sortingView.bubbleSort()
        
    }
    
    
    
}


