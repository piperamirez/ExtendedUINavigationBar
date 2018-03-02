//
//  ExtendedViewController.swift
//  ExtendedNavigationController
//
//  Created by Felipe Ramírez on 3/1/18.
//  Copyright © 2018 Felipe Ramírez. All rights reserved.
//

import UIKit

class ExtendedViewController: UIViewController {
    
    var initialHeaderHeight: CGFloat = 0.0
    private var headerHeight: CGFloat = 10.0
    
    var headerView: ExtendedHeaderView?
    var contentView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView = ExtendedHeaderView(withHeight: headerHeight)
        self.view.addSubview(headerView!)
        self.view.backgroundColor = #colorLiteral(red: 0.9639434218, green: 0.9686880708, blue: 0.9771985412, alpha: 1)
        headerView?.backgroundColor = .white
        headerView?.dropShadow(color: .black, opacity: 0.05, offSet: CGSize(width: 0, height: 3), radius: 5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        headerView?.height = initialHeaderHeight
        UIView.animate(
            withDuration: 0.35,
            delay: 0.0,
            options: [.curveEaseOut],
            animations: {
                self.headerView?.height = self.headerHeight
            },
            completion: nil
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let previousViewController = self.navigationController?.viewControllers.last {
            let previousViewController = previousViewController as! ExtendedViewController
            previousViewController.initialHeaderHeight = self.headerHeight
            UIView.animate(
                withDuration: 0.35,
                delay: 0.0,
                options: [.curveEaseOut],
                animations: {
                    self.headerView?.height = previousViewController.headerHeight
                },
                completion: nil
            )
        }
    }
    
    func setHeaderView(_ view: UIView) {
        headerHeight = view.bounds.height
        headerView?.setView(view)
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
