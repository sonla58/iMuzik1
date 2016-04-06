//
//  detailViewController.swift
//  iMuzik1
//
//  Created by Anh Son Le on 4/7/16.
//  Copyright © 2016 Anh Son Le. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var settingReceive: MCSetting!
    
    @IBOutlet weak var lblDetail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = settingReceive.title
        self.lblDetail.text = settingReceive.content
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
