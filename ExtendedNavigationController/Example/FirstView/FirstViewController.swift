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
        title = "Custom"
        view.backgroundColor = #colorLiteral(red: 0.9639434218, green: 0.9686880708, blue: 0.9771985412, alpha: 1)
        
        // We tell our ExtendedViewController how tall is it's header. He will
        // internally compute dimensions for the content view
        headerHeight = 100
        
        // We define a custom UIView from a nib file and initialize it with
        // a desired height and set it to this ExtendedViewController's header
        // view. We leave a reference to it so we can access it later.
        let header = FirstViewHeader()
        setHeaderView(header)
        
        // Then we can access properties of our custom ExtendedHeaderView
        header.titleLabel.text = "Hey! I have access to this view 🎉"
        
        // Now we programmatically create a UIView and set it to this
        // ExtendedViewController's content view.
        let content = UIView()
        setContentView(content)
        
        // Then we can use the content view
        content.backgroundColor = .white
    }

}
