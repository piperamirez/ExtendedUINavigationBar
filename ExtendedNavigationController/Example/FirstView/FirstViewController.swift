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
        title = "First"
        
        // We define a subclass of ExtendedHeaderView and initialize it with
        // a desired height and set it to this ExtendedViewController's header
        // view.
        let header = FirstViewHeader(withHeight: 100)
        setHeaderView(header)
        
        // Then we can access properties of our custom ExtendedHeaderView
        header.titleLabel.text = "Hey! I have access to this view 🎉"
    }

}
