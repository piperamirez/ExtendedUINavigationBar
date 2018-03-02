//
//  FirstViewController.swift
//  ExtendedNavigationController
//
//  Created by Felipe Ramírez on 3/1/18.
//  Copyright © 2018 Felipe Ramírez. All rights reserved.
//

import UIKit

class FirstViewController: ExtendedViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First"
        headerHeight = 100
        let header = FirstViewHeader(withHeight: 100)
        header.titleLabel.text = "Hey, I'm the view controller!"
        self.headerView?.setView(header)
    }

}
