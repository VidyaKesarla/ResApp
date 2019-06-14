//
//  GuideProfileViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 06/05/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase
class GuideProfileViewController: UIViewController {
    
    var GuideArray:[Admindatamodel] = []
    
//    var Guidename:String?
//    var Dob:String?
//    var Gend:String?
//    var Nationality:String?
//    var Contactno:String?
//    var Emailid:String?
//    var Address:String?
//    var Correspondence:String?
//    var Employmenttype:String?
//    var Award:String?
//    var Fieldofexpertise:String?
//    var Patents:String?
//    var Projects:String?
//    var Password:String?
//    var uid:String?
//    var role:Int?
    
    
    @IBOutlet weak var contactno: UILabel!
    @IBOutlet weak var guidename: UILabel!
    
    @IBOutlet weak var dob: UILabel!
    
    @IBOutlet weak var Gend: UILabel!
    
    @IBOutlet weak var nationality: UILabel!
//    func  {
//    
//    }
    
    
    func fetchGuideBasic(userid: String){
        let db = Database.database().reference()
        let ref = db.child("FetchUserdetails").child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")").child(userid)
        
        ref.observe(DataEventType.value) { (snap) in
            print("snap1 = \(snap)")
            let event = snap.value as? [String:Any]
            print("event1 = \(event)")
            for (key1,value1) in event!
            {
                let ref =  db.child("FetchUserdetails").child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")").child(userid).child(key1)
                
                print("key1:",key1)
                ref.observe(DataEventType.value) { (snap) in
                    print("snap2 = \(snap)")
                    let event = snap.value as? [String:Any]
                    print("event2 = \(event)")
                    let obj = Admindatamodel().basicguidedate(data: (event as! [String:Any]!))
                    //(data:[String:Any])
                    
                    self.GuideArray.append(obj)
                    print("subArray = \(self.GuideArray.count)")
                    //self.ServiceTableView.reloadData()
                    
                    
                }
            }
            
            
        }
        
        
    }
    
    
//    func fetchGuides(uid: String?)
//    {
//        let db = Database.database().reference()
//        let ref = db.child("FetchUserdetails").child(year).child(dept).child(key)
//        print("key:",key)
//
//
//        // print("year = \(appdelegate.year)")
//        //print("dept = \(appdelegate.dept)")
//        //observing the data changes
//        ref.observe(DataEventType.value) { (snapshot) in
//            // print("snap = \(snapshot)")
//            let event = snapshot.value as? [String:Any]
//            //print("event = \(event)")
//            for (key,value) in event!
//            {
//                let ref = db.child("FetchUserdetails").child(year).child(dept).child(key)
//                print("key:",key)
//
//                ref.observe(DataEventType.value) { (snap) in
//                    // print("snap2 = \(snap)")
//                    let event = snap.value as? [String:Any]
//                    //print("event2 = \(event)")
//                    for (key1,value1) in event!
//                    {
//                        let ref =
//                            db.child("FetchUserdetails").child(year).child(dept).child(key).child(key1)
//
//                        print("key1:",key1)
//                        ref.observe(DataEventType.value) { (snap) in
//                            print("snap1 = \(snap)")
//                            let event = snap.value as? [String:Any]
//                            //   print("event1 = \(event)")
//                            let obj = Admindatamodel().basicguidedate(data: (event as! [String:Any]))
//
//                            self.GuideArray.append(obj)
//                            print("subArray = \(self.GuideArray.count)")
//                            self.guideTable.reloadData()
//
//
//                        }
//                    }
//
//
//                }
//            }
//        }
//    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
