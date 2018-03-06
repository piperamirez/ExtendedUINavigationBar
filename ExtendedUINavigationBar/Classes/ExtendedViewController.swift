//
//  ExtendedViewController.swift
//  ExtendedNavigationController
//
//  Created by Felipe Ramírez on 3/1/18.
//  Copyright © 2018 Felipe Ramírez. All rights reserved.
//

import UIKit

open class ExtendedViewController: UIViewController {
    
    open var headerHeight: CGFloat = 0.0
    open var headerMargin: CGFloat = 0.0
    open var headerView: UIView?
    open var contentView: UIView?
    
    // Approximately the duration of a show segue
    open var animationDuration: TimeInterval = 0.35
    
    var initialHeaderHeight: CGFloat = 0.0
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = UIView(frame: CGRect.zero)
        view.addSubview(headerView!)
        
        contentView = UIView(frame: CGRect.zero)
        view.addSubview(contentView!)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        headerView?.frame = getHeaderFrame(withHeight: initialHeaderHeight)
        contentView?.frame = getContentFrame(withHeaderHeight: initialHeaderHeight)
        UIView.animate(
            withDuration: animationDuration,
            delay: 0.0,
            options: [.curveEaseOut],
            animations: {
                self.headerView?.frame = self.getHeaderFrame(withHeight: self.headerHeight)
                self.contentView?.frame = self.getContentFrame(withHeaderHeight: self.headerHeight)
            },
            completion: nil
        )
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let previousViewController = self.navigationController?.viewControllers.last {
            let previousViewController = previousViewController as! ExtendedViewController
            previousViewController.initialHeaderHeight = self.headerHeight
            UIView.animate(
                withDuration: animationDuration,
                delay: 0.0,
                options: [.curveEaseOut],
                animations: {
                    self.headerView?.frame = self.getHeaderFrame(withHeight: previousViewController.headerHeight)
                    self.contentView?.frame = self.getContentFrame(withHeaderHeight: previousViewController.headerHeight)
                },
                completion: nil
            )
        }
    }
    
    open func setHeaderView(_ view: UIView) {
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.clipsToBounds = true
        headerView?.addSubview(view)
    }
    
    open func setContentView(_ view: UIView) {
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.clipsToBounds = true
        contentView?.addSubview(view)
    }
    
    func getHeaderFrame(withHeight height: CGFloat) -> CGRect {
        return CGRect(
            x: view.bounds.minX,
            y: view.bounds.minY,
            width: view.bounds.width,
            height: height
        )
    }
    
    func getContentFrame(withHeaderHeight headerHeight: CGFloat) -> CGRect {
        return CGRect(
            x: view.bounds.minX,
            y: view.bounds.minY + headerHeight + headerMargin,
            width: view.bounds.width,
            height: view.bounds.height - headerHeight - headerMargin
        )
    }

}
