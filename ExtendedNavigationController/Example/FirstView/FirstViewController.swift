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
        
        // We tell our ExtendedViewController how tall is it's header. He will
        // internally compute dimensions for the content view
        headerHeight = 100
        
        // We define a subclass of ExtendedHeaderView and initialize it with
        // a desired height and set it to this ExtendedViewController's header
        // view. We leave a reference to it so we can access it later.
        let header = FirstViewHeader()
        setHeaderView(header)
        
        // Then we can access properties of our custom ExtendedHeaderView
        header.titleLabel.text = "Hey! I have access to this view 🎉"
        
        // Now we programmatically create a ExtendedContentView and set it to
        // this ExtendedViewController's content view.
        /*
        let content = ExtendedContentView(withHeaderHeight: 100)
        content.backgroundColor = .white
        setContentView(content)
        */
    }

}
