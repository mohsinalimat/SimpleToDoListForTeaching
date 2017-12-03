//
//  TaskTableViewCell.swift
//  task app master demo
//
//  Created by Dilraj Devgun on 12/2/17.
//  Copyright © 2017 Dilraj Devgun. All rights reserved.
//

import Foundation
import UIKit

class TaskTableViewCell: UIView {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var colourIndicator: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    init(frame:CGRect, name:String, time:String) {
        super.init(frame: frame)
        setUp()
        self.taskNameLabel.text = name
        self.timeLabel.text = time
        self.taskNameLabel.adjustsFontSizeToFitWidth = true
        self.timeLabel.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    override func prepareForInterfaceBuilder() {
        setUp()
    }
    
    // a setup method which gets the view from the xib file we created. This will allow us to put that xib in our view
    func setUp() {
        //get the bundle of our project
        let bundle = Bundle(for: type(of: self))
        //get the nib class from our project
        let nib = UINib(nibName: "TaskTableViewCell", bundle: bundle)
        //get the view we designed in the nib file and then add it as a subview to the uiview with the approproate constraints
        let viewFromNib = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        addSubview(viewFromNib)
        viewFromNib.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[v]|",
                options: NSLayoutFormatOptions(rawValue: 0),
                metrics: nil,
                views: ["v":viewFromNib]
            )
        )
        self.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[v]|",
                options: NSLayoutFormatOptions(rawValue: 0),
                metrics: nil, views: ["v":viewFromNib]
            )
        )
        
        self.colourIndicator.layer.cornerRadius = self.colourIndicator.frame.width/2
    }
}
