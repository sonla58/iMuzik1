//
//  SettingTableViewCell.swift
//  iMuzik1
//
//  Created by Anh Son Le on 4/6/16.
//  Copyright © 2016 Anh Son Le. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var subContentView: UIView!
    
    var setting: MCSetting?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = CGRect(x: 8, y: 2, width: UIScreen.mainScreen().bounds.size.width - 16, height: 48)
        blurEffectView.layer.cornerRadius = 5
        blurEffectView.layer.masksToBounds = true
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        self.subContentView.addSubview(blurEffectView)
        
        let top = NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: subContentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: subContentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: subContentView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 8)
        let leading = NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: subContentView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 8)
        
        subContentView.addConstraints([top, bottom, trailing, leading])
        blurEffectView.updateConstraints()
        subContentView.updateConstraints()
        
        self.subContentView.bringSubviewToFront(lblTitle)
    }
    
    func setSettingForCell(setting: MCSetting){
        self.setting = setting
        self.lblTitle.text = setting.title
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
