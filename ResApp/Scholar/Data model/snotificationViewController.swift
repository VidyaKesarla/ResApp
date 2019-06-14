//
//  snotificationViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 02/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase

class snotificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{

    var notifyobj:[UserdetilsDataModel] = []
    
    @IBOutlet weak var notfn: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.getnotificationdata(dep: scholerdep!) { (notification, error) in
            self.notifyobj = (notification as? [UserdetilsDataModel])!
          
              self.notfn.reloadData()
        }
    }
    
    

    func getnotificationdata(dep:String,callBack:@escaping ResponseHandlerBlock )
    {
        let db = Database.database().reference()
        
        let userdetails_ref = db.child("Notifications").child(dep).child(appdelegate.uid!)
        
        
        // let demo = userdetails_ref.child("0Q7aMMzwXQXC5xh1quuGeHlCds92")
        var UserDetail:[UserdetilsDataModel] = []
        // var useruid:[UserdetilsDataModel] = []
        
        //       useruid.removeAll()
           UserDetail.removeAll()
        userdetails_ref.observe(DataEventType.value, with:
            { (snapshot) in
                print("the snap = \(snapshot)")
                let eventDataloc = snapshot.value as? [String: AnyObject] ?? [:]
                for (key,val) in eventDataloc
                {
                    let userdetails_ref = db.child("Notifications").child(dep).child(appdelegate.uid!).child(key)
                    
                    
                   
                    userdetails_ref.observe(DataEventType.value, with:
                        { (snapshot1) in
                            let eventDataloc1 = snapshot1.value as? [String: AnyObject] ?? [:]
                            
                            print("eventDataloc = \(eventDataloc1)")
                            let userobj = UserdetilsDataModel().getnotification(notify: eventDataloc1)
                            
                            //  let depatObj = AllUserDetails(withDictionary: eventDataloc )
                            
                            UserDetail.append(userobj)
                            
                            callBack((UserDetail as AnyObject?)!,  nil)
                    })
                }
                
        })
        
        
        
        
      
        
        
        
        
        
        
        //
        //    let db = Database.database().reference()
        //    func getuserDetails(setuserid:String,callBack:@escaping ResponseHandlerBlock )
        //    {
        //        //let db = FIRDatabase.database().reference()
        //
        //        print("uid in clouser = \(setuserid)")
        //
        //        let userdetails_ref = db.child("userDetailsforlogin").child(setuserid)
        //
        //
        //        // let demo = userdetails_ref.child("0Q7aMMzwXQXC5xh1quuGeHlCds92")
        //        var UserDetail:[AllUserDetails] = []
        //        var useruid:[AllUserDetails] = []
        //
        //        useruid.removeAll()
        //        UserDetail.removeAll()
        //        userdetails_ref.observe(DataEventType.value, with:
        //            { (snapshot) in
        //
        //
        //                print("snap = \(snapshot)")
        //
        //
        //                let eventDataloc = snapshot.value as? [String: AnyObject] ?? [:]
        //
        //                print("eventDataloc = \(eventDataloc)")
        //
        //                let depatObj = AllUserDetails(withDictionary: eventDataloc )
        //
        //                UserDetail.append(depatObj)
        //
        //
        //
        //
        //                callBack(UserDetail as AnyObject?,  nil)
        //        })
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print("self.notifyobj.count = \(self.notifyobj.count)")
        return self.notifyobj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! schnotificationsTableViewCell
        cell.notificationtext.text = self.notifyobj[indexPath.row].notificationmsg!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 180
    }
    
}
