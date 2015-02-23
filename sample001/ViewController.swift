//
//  ViewController.swift
//  sample001
//
//  Created by Takatomo Okitsu on 2015/02/12.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var notificationToken: RLMNotificationToken?
    var results:RLMResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.results = User.allObjects()
        
        
        RealmPerformance.calcPerform()
//        CoreDataPerformance.calcPerform()
        
//        RealmPerformance.fetchName()
        
        //
//        self.results = Status.allObjects().sortedResultsUsingProperty("createdAt", ascending: false)
//        self.tableView.reloadData()
//        
//        notificationToken = RLMRealm.defaultRealm().addNotificationBlock { note, realm in
//            self.tableView.reloadData()
//        }

        
    
//        let status:Status = Status()
//        status.id = "200"
//        status.text = "what are you doing?"
//        status.createdAt = NSDate().timeIntervalSince1970
        
//        let user = User(forPrimaryKey: "1")
        
//        realm.transactionWithBlock({ () -> Void in
//            user.statuses.addObject(status)
//        })
        
//        realm.beginWriteTransaction()
//        user.statuses.addObject(status)
//        realm.commitWriteTransaction()

        
//        let statuses = user.statuses
//        let count = statuses.count
//        Z
//        let s: AnyObject! = statuses[0]
        
//        let predicate = NSPredicate(format: "name == %@", "kenta tanaka")
//        let user2 = User.objectsWithPredicate(predicate)
        
//        let userDict = [
//            "id": "1007978",
//            "createdAt": NSDate().timeIntervalSince1970,
//            "age": 100
//        ]
//        let u = User.createOrUpdateInDefaultRealmWithObject(userDict)
//
//        
//        realm.transactionWithBlock({ () -> Void in
//        })

        
//        
//        
//        
//        var menuButton = UIBarButtonItem(title:"Menu", style: .Plain, target: self, action: "menu:")
//        self.navigationItem.setRightBarButtonItem(menuButton, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func menu(sender: UIBarButtonItem) {
        var alertController = UIAlertController(title: "Menu", message: nil, preferredStyle: .ActionSheet)
        
        let realmAction:UIAlertAction = UIAlertAction(title: "Add Realm",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction!) -> Void in
                self.addRealm()
        })

        let coreadataAction:UIAlertAction = UIAlertAction(title: "Add CoreData",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction!) -> Void in
                self.addCoreData()
        })

        let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler:nil)
        
        alertController.addAction(realmAction)
        alertController.addAction(coreadataAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func addRealm() {
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
    
    func addCoreData(){
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(self.results!.count)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("contentCell", forIndexPath: indexPath) as! UITableViewCell;
        let user:User = self.results!.objectAtIndex(UInt(indexPath.row)) as! User
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.createdAt.description
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
        
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
        
        // おおよその見積もりの高さ。これつけるとレンダリング早くなる
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
}

