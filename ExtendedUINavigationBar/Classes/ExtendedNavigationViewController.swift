//
//  ExtendedNavigationViewController.swift
//  ExtendedNavigationController
//
//  Created by Felipe Ramírez on 3/1/18.
//  Copyright © 2018 Felipe Ramírez. All rights reserved.
//

import UIKit

open class ExtendedNavigationViewController: UINavigationController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
    
}
