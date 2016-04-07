//
//  SoundCollectionViewCell.swift
//  iMuzik1
//
//  Created by Anh Son Le on 4/5/16.
//  Copyright © 2016 Anh Son Le. All rights reserved.
//

import UIKit
import AVFoundation

class SoundCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var btnToggleSound: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    var soundForCell: MCSound?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnToggleSound.layer.opacity = 0.5
        volumeSlider.hidden = true
        volumeSlider.setThumbImage(UIImage(named: "Knob" ), forState: UIControlState.Normal)
    }
    
    func setSoundForCell(sound :MCSound) {
        soundForCell = sound
        sound.changeVolume(sound.audioVulume!)
        self.volumeSlider.value = sound.audioVulume!
        //set image sound
        btnToggleSound.setImage(sound.image, forState: UIControlState.Normal)
        btnToggleSound.setImage(sound.image, forState: UIControlState.Selected)
    }
    
    
    @IBAction func changeVolume() {
        soundForCell!.changeVolume(volumeSlider.value / volumeSlider.maximumValue)
        btnToggleSound.layer.opacity = (volumeSlider.value/2) + 0.5
    }
    
    @IBAction func toggleSound(sender: UIButton) {
        btnToggleSound.selected = !btnToggleSound.selected
        if btnToggleSound.selected == true {
            soundForCell!.playSound()
            btnToggleSound.layer.opacity = (soundForCell!.audioVulume! / 2) + 0.5
            btnToggleSound.layer.shadowOpacity = 0.3
            volumeSlider.hidden = false
        } else {
            soundForCell!.stopSound()
            btnToggleSound.layer.opacity = 0.5
            btnToggleSound.layer.shadowOpacity = 0
            volumeSlider.hidden = true
        }
    }
}
