//
//  SettingTableViewCell.swift
//  iMuzik1
//
//  Created by Anh Son Le on 4/6/16.
//  Copyright © 2016 Anh Son Le. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRect(x: 0, y: 2, width: UIScreen.mainScreen().bounds.size.width, height: 48)
        
        self.contentView.addSubview(blurEffectView)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
