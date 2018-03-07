//
//  SecondViewController.swift
//  ExtendedNavigationController
//
//  Created by Felipe Ramírez on 3/1/18.
//  Copyright © 2018 Felipe Ramírez. All rights reserved.
//

import UIKit

class SecondViewController: MyExtendedViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Default"
        setHeader(UIView())
        setContent(SecondViewContent())
    }
    
}
