//
//  FirstViewHeader.swift
//  ExtendedNavigationController
//
//  Created by Felipe Ramírez on 3/2/18.
//  Copyright © 2018 Felipe Ramírez. All rights reserved.
//

import UIKit

class FirstViewHeader: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    init() {
        super.init(frame: CGRect.zero)
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
    
    func loadFromNib() {
        Bundle.main.loadNibNamed("FirstViewHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
