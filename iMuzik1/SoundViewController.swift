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
        //blurEffectView.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: 64)
        
        naviBarView.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: naviBarView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: naviBarView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: naviBarView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 64)
        
        naviBarView.addConstraints([leading,top,trailing])
        blurEffectView.addConstraint(height)
        
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
        return demoSoundList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SoundCell", forIndexPath: indexPath) as! SoundCollectionViewCell
        let sound = demoSoundList[indexPath.row]
        cell.setSoundForCell(sound)
        if sound.isSelected == true {
            sound.playSound()
            cell.btnToggleSound.selected = true
            cell.btnToggleSound.layer.shadowOpacity = 0.3
            cell.btnToggleSound.layer.opacity = (sound.audioVulume! / 2) + 0.5
            cell.volumeSlider.hidden = false
        } else {
            sound.stopSound()
            cell.btnToggleSound.selected = false
            cell.btnToggleSound.layer.shadowOpacity = 0
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
