//
//  SecondViewContent.swift
//  ExtendedNavigationController
//
//  Created by Felipe Ramírez on 3/2/18.
//  Copyright © 2018 Felipe Ramírez. All rights reserved.
//

import UIKit

class SecondViewContent: UIView {

    @IBOutlet var contentView: UIView!
    
    init() {
        super.init(frame: CGRect.zero)
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
    
    func loadFromNib() {
        Bundle.main.loadNibNamed("SecondViewContent", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
