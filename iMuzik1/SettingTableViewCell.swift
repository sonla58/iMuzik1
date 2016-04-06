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
        blurEffectView.frame = CGRect(x: 8, y: 2, width: UIScreen.mainScreen().bounds.size.width - 16, height: 48)
        blurEffectView.layer.cornerRadius = 5
        blurEffectView.layer.masksToBounds = true
        
        self.contentView.addSubview(blurEffectView)
        self.contentView.bringSubviewToFront(subContentView)
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
