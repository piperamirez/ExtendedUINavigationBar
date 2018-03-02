//
//  ExtendedHeaderView.swift
//  ExtendedNavigationController
//
//  Created by Felipe Ramírez on 3/2/18.
//  Copyright © 2018 Felipe Ramírez. All rights reserved.
//

import UIKit

class ExtendedHeaderView: UIView {
    
    var height: CGFloat = 10.0 {
        didSet {
            self.frame = getFrame(withHeight: height)
        }
    }
    
    init(withHeight height: CGFloat) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height))
    }
    
    override func didMoveToSuperview() {
        self.frame = getFrame(withHeight: height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func getFrame(withHeight height: CGFloat) -> CGRect {
        guard let superview = self.superview else {
            return CGRect.zero
        }
        return CGRect(
            x: superview.bounds.minX,
            y: superview.bounds.minY,
            width: superview.bounds.width,
            height: height
        )
    }
    
    func setView(_ view: UIView) {
        addSubview(view)
    }

}
