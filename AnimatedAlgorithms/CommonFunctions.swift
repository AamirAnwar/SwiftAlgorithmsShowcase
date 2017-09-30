//
//  CommonFunctions.swift
//  AnimatedAlgorithms
//
//  Created by Aamir  on 30/09/17.
//  Copyright © 2017 AamirAnwar. All rights reserved.
//

import Foundation

func delay(_ seconds: Double, completion: @escaping ()->Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(Int(seconds * 1000.0))) {
        completion()
    }
}

