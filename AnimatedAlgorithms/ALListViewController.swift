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
        self.navigationItem.title = kListPageHeading
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            showAnimationDetailWith(view: ALBubbleSortView())
            
        case 1:
            showAnimationDetailWith(view: ALSelectionSortView())
        
        default:
            break
        }
    }
    
    func showAnimationDetailWith(view:AnimatedAlgorithmView) {
        let vc = ALAlgorithmDetailViewController()
        vc.sortingView = view
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

