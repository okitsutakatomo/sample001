//
//  AddViewController.swift
//  sample001
//
//  Created by Takatomo Okitsu on 2015/02/12.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(sender: UIButton) {
        dispatch_async(QueueHelper.sharedInstance.saveQueue(), { () -> Void in
            let realm = RLMRealm.defaultRealm()
            
            realm.transactionWithBlock({ () -> Void in
                for idx1 in 0..<100 {
                    var user:User = User.createOrUpdateInDefaultRealmWithObject([
                        "id": "\(idx1)",
                        "index": idx1,
                        "name": "\(idx1)" + " name",
                        "createdAt": NSDate()
                        ])
                    println("user:" + "\(idx1)")
                    
                    // Add row via dictionary. Property order is ignored.
                    for idx2 in idx1*100..<idx1*100 + 100 {
                        var status = Status.createOrUpdateInDefaultRealmWithObject([
                            "id": "\(idx2)",
                            "text": "\(idx2)" + " comment",
                            "createdAt": NSDate()
                            ])
                        user.statuses.addObject(status)
                        println("comment:" + "\(idx2)")
                    }
                }
            })
        })
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
