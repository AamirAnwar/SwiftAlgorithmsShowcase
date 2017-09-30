//
//  ALListViewController.swift
//  AnimatedAlgorithms
//
//  Created by Aamir  on 23/09/17.
//  Copyright © 2017 AamirAnwar. All rights reserved.
//

import UIKit

class ALListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == kShowAnimationDetailSegueIdentifier, let detailVC = segue.destination as? ALAlgorithmDetailViewController {
            detailVC.sortingView = ALBubbleSortView()
        }
    }
}

