//
//  SettingViewController.swift
//  iMuzik1
//
//  Created by Anh Son Le on 4/5/16.
//  Copyright © 2016 Anh Son Le. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var naviBarView: UIView!
    @IBOutlet weak var settingTable: UITableView!

    var listSetting: [MCSetting]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        listSetting = MCSetting.makeDemoList()
        
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: 64)
//        
//        naviBarView.addSubview(blurEffectView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSetting.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SettingTableViewCell
        cell.setSettingForCell(listSetting[indexPath.row])
        cell.backgroundColor = cell.contentView.backgroundColor
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! DetailViewController
        if let row = self.settingTable.indexPathForSelectedRow?.row {
            detailVC.settingReceive = self.listSetting[row]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let detailVC = segue.destinationViewController as! DetailViewController
//        detailVC.settingReceive = self.listSetting[sendIndex!]
//        
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
