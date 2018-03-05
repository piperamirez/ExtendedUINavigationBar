//
//  SecondViewController.swift
//  ExtendedNavigationController
//
//  Created by Felipe Ramírez on 3/1/18.
//  Copyright © 2018 Felipe Ramírez. All rights reserved.
//

import UIKit

class SecondViewController: ExtendedViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Default"
        view.backgroundColor = #colorLiteral(red: 0.9639434218, green: 0.9686880708, blue: 0.9771985412, alpha: 1)
                
        let header = UIView()
        setHeaderView(header)
        header.backgroundColor = .white
        
        let content = UIView()
        setContentView(content)
        content.backgroundColor = .white
    }
    
}
