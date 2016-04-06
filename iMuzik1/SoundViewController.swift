//
//  SoundViewController.swift
//  iMuzik1
//
//  Created by Anh Son Le on 4/5/16.
//  Copyright © 2016 Anh Son Le. All rights reserved.
//

import UIKit

class SoundViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var naviBarView: UIView!
    @IBOutlet weak var soundCollectionView: UICollectionView!
    
    @IBOutlet weak var btnToggleAll: UIButton!
    
    var demoSoundList :[MCSound] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Add blur effect in navi bar
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: 64)
        
        naviBarView.addSubview(blurEffectView)
        
        demoSoundList = MCSound.makeDemoList()
    }
    
    @IBAction func toggleAll(sender: UIButton) {
        sender.selected = !sender.selected
        if sender.selected == true {
            for i in demoSoundList {
                i.playSound()
            }
        } else {
            for i in demoSoundList {
                i.stopSound()
            }
        }
        soundCollectionView.reloadData()
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //xoa khi co model
        print(demoSoundList.count)
        return demoSoundList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SoundCell", forIndexPath: indexPath) as! SoundCollectionViewCell
        let sound = demoSoundList[indexPath.row]
        cell.setSoundForCell(sound)
        if sound.isSelected == true {
            sound.playSound()
            cell.btnToggleSound.layer.opacity = (sound.audioVulume! / 2) + 0.5
            cell.volumeSlider.hidden = false
        } else {
            sound.stopSound()
            cell.btnToggleSound.layer.opacity = 0.4
            cell.volumeSlider.hidden = true
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
