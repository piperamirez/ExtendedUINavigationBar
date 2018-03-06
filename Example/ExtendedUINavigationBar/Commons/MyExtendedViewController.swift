//
//  MyExtendedViewController.swift
//  ExtendedUINavigationBar_Example
//
//  Created by Felipe Ramirez on 3/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import ExtendedUINavigationBar

class MyExtendedViewController: ExtendedViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        headerHeight = 10.0
        headerMargin = 10.0
        headerView?.backgroundColor = .white
        contentView?.backgroundColor = .white
        headerView?.dropShadow(
            color: .black,
            opacity: 0.05,
            offSet: CGSize(width: 0, height: 3),
            radius: 5
        )
        view.backgroundColor = #colorLiteral(red: 0.9639434218, green: 0.9686880708, blue: 0.9771985412, alpha: 1)
    }

}

extension UIView {
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
    }
}
