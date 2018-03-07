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
        animateResize(withHeight: self.headerHeight)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let previousViewController = self.navigationController?.viewControllers.last {
            if let previousViewController = previousViewController as? ExtendedViewController {
                previousViewController.initialHeaderHeight = self.headerHeight
                animateResize(withHeight: previousViewController.headerHeight)
            }
        }
    }
    
    open func setHeader(_ view: UIView) {
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.clipsToBounds = true
        headerView?.addSubview(view)
    }
    
    open func setContent(_ view: UIView) {
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
    
    open func setHeaderHeight(_ headerHeight: CGFloat) {
        self.headerHeight = headerHeight
        animateResize(withHeight: headerHeight)
    }
    
    private func animateResize(withHeight height: CGFloat) {
        UIView.animate(
            withDuration: animationDuration,
            delay: 0.0,
            options: [.curveEaseOut],
            animations: {
                self.headerView?.frame = self.getHeaderFrame(withHeight: height)
                self.contentView?.frame = self.getContentFrame(withHeaderHeight: height)
            },
            completion: nil
        )
    }

}
