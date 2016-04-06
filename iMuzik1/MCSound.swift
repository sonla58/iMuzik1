//
//  MCSound.swift
//  iMuzik1
//
//  Created by Anh Son Le on 4/5/16.
//  Copyright © 2016 Anh Son Le. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

//MC: My Class
class MCSound {
    var image: UIImage?
    var title: String?
    var isSelected: Bool?
    var audioPlayer: AVAudioPlayer?
    var audioVulume: Float?
    
    init(title: String, image: UIImage, isSelected: Bool){
        self.title = title
        self.image = image
        self.isSelected = isSelected
        audioVulume = 0.5
        
        let soundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(title, ofType: "mp3")!)
        do{
            audioPlayer = try AVAudioPlayer(contentsOfURL: soundURL, fileTypeHint: nil)
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer?.prepareToPlay()
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.volume = audioVulume!
        } catch let error as NSError{ print(error) }
    }
    
    func playSound() {
        audioPlayer?.play()
        self.isSelected = true
    }
    
    func stopSound() {
        audioPlayer?.stop()
        self.isSelected = false
    }
    
    func changeVolume(value: Float){
        audioPlayer?.volume = value
        self.audioVulume = value
    }
    
    func toggleSelect() {
        self.isSelected = !self.isSelected!
    }
    
    static func makeDemoList() -> [MCSound] {
        let demoSoundList = [
            MCSound(title: "brownnoise", image: UIImage(named: "Icon_brownNoise")!, isSelected: false),
            MCSound(title: "coffee", image: UIImage(named: "icon_coffee")!, isSelected: false),
            MCSound(title: "fan", image: UIImage(named: "icon_fan")!, isSelected: false),
            MCSound(title: "fire", image: UIImage(named: "icon_fire")!, isSelected: false),
            MCSound(title: "forest", image: UIImage(named: "icon_forest")!, isSelected: false),
            MCSound(title: "leaves", image: UIImage(named: "icon_leaves")!, isSelected: false),
            MCSound(title: "pinknoise", image: UIImage(named: "icon_pinkNoise")!, isSelected: false),
            MCSound(title: "rain", image: UIImage(named: "icon_rain")!, isSelected: false),
            MCSound(title: "seaside", image: UIImage(named: "icon_seaside")!, isSelected: false),
            MCSound(title: "summernight", image: UIImage(named: "icon_night")!, isSelected: false),
            MCSound(title: "thunderstorm", image: UIImage(named: "icon_thunderstorm")!, isSelected: false),
            MCSound(title: "train", image: UIImage(named: "icon_train")!, isSelected: false),
            MCSound(title: "water", image: UIImage(named: "icon_water")!, isSelected: false),
            MCSound(title: "waterstream", image: UIImage(named: "icon_waterStream")!, isSelected: false),
            MCSound(title: "whitenoise", image: UIImage(named: "icon_whitenoise")!, isSelected: false),
            MCSound(title: "wind", image: UIImage(named: "icon_wind")!, isSelected: false)
        ]
        return demoSoundList
    }
}