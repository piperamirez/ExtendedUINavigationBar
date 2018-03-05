//
//  ExtendedViewController.swift
//  ExtendedNavigationController
//
//  Created by Felipe Ramírez on 3/1/18.
//  Copyright © 2018 Felipe Ramírez. All rights reserved.
//

import UIKit

open class ExtendedViewController: UIViewController {
    
    var initialHeaderHeight: CGFloat = 10.0
    open var headerHeight: CGFloat = 10.0
    
    open var headerView: UIView?
    open var contentView: UIView?
    
    let padding: CGFloat = 10.0
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = UIView(frame: CGRect.zero)
        headerView?.dropShadow(color: .black, opacity: 0.05, offSet: CGSize(width: 0, height: 3), radius: 5)
        view.addSubview(headerView!)
        
        contentView = UIView(frame: CGRect.zero)
        view.addSubview(contentView!)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        headerView?.frame = getHeaderFrame(withHeight: initialHeaderHeight)
        contentView?.frame = getContentFrame(withHeaderHeight: initialHeaderHeight)
        UIView.animate(
            withDuration: 0.35,
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
                withDuration: 0.35,
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
            y: view.bounds.minY + headerHeight + padding,
            width: view.bounds.width,
            height: view.bounds.height - headerHeight - padding
        )
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
