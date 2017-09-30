//
//  ALAlgorithmDetailViewController.swift
//  AnimatedAlgorithms
//
//  Created by Aamir  on 23/09/17.
//  Copyright © 2017 AamirAnwar. All rights reserved.
//

import UIKit

class ALAlgorithmDetailViewController: UIViewController, CAAnimationDelegate {
    var sortingView:AnimatedAlgorithmView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortingView.frame = view.bounds
        view.backgroundColor = UIColor.white
        view.addSubview(sortingView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sortingView.start()
    }
    
    
    
}


