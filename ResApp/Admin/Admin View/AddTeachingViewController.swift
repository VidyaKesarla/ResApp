//
//  AddTeachingViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 09/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class AddTeachingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var GuideArray:[Admindatamodel] = []
    var GuideArray2:[Admindatamodel] = []

    @IBOutlet weak var ServiceTableView: UITableView!
    //    var Slno2:String?
//    var From2:String?
//    var To2:String?
//    var NOY:String?
//    var Degree2:String?
//    var Designation:String?
//    var Instname:String?
//
    @IBOutlet weak var MembershipTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       var numberofrows = 1
        switch tableView{
        case ServiceTableView:
            numberofrows = GuideArray.count
        case MembershipTableView:
            numberofrows = GuideArray2.count
        default:
            print("1")
        }
        return numberofrows
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var returnCell = UITableViewCell()
        var cell = UITableViewCell()
        switch tableView{
        case ServiceTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "servicecell", for: indexPath) as! AddTeachingTableViewCell
            cell.slno.text = GuideArray[indexPath.row].slno2
//            cell.from.text = GuideArray[indexPath.row].from2
  //          cell.to.text = GuideArray[indexPath.row].to2
            cell.noofyears.text = GuideArray[indexPath.row].nOY
            cell.degree.text = GuideArray[indexPath.row].degree2
            cell.designation.text = GuideArray[indexPath.row].designation
            cell.instname.text = GuideArray[indexPath.row].instname
        
            //returnCell = cell
            //return returnCell
        case MembershipTableView:
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "membershipcell", for: indexPath) as! AddMembershipTableViewCell
            //cell.slno.text = GuideArray[indexPath].sln
                cell.slno.text = GuideArray2[indexPath.row].slno3
            print("slnooooo","\(GuideArray2[indexPath.row].slno3)")
                cell.body.text = GuideArray2[indexPath.row].body
                cell.instname.text = GuideArray2[indexPath.row].orgname
              //  returnCell = cell
            //return returnCell
    
      //  return returnCell
        
        default:
         print("hiiii")
        }
        return cell
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
   
  
    
    
  
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchGuideService(uid: appdelegate.uid!)
        self.fetchGuideMemb(uid: appdelegate.uid!)
    }
    func fetchGuideService(uid: String){
        let db = Database.database().reference()
        let ref = db.child("Academic details").child("Service details").child(uid)
        
        ref.observe(DataEventType.value) { (snap) in
            print("snap1 = \(snap)")
            let event = snap.value as? [String:Any]
            print("event1 = \(event)")
            for (key1,value1) in event!
            {
                let ref =  db.child("Academic details").child("Service details").child(uid).child(key1)
                
                print("key1:",key1)
                ref.observe(DataEventType.value) { (snap) in
                    print("snap2 = \(snap)")
                    let event = snap.value as? [String:Any]
                    print("event2 = \(event)")
                    let obj = Admindatamodel().servicedata(data: (event as! [String:Any]!))
                    //(data:[String:Any])
                    
                    self.GuideArray.append(obj)
                    print("subArray = \(self.GuideArray.count)")
                    self.ServiceTableView.reloadData()
                    
                    
                }
            }
            
            
        }
        
        
    }
    func fetchGuideMemb(uid: String){
        let db = Database.database().reference()
        let ref = db.child("Academic details").child("Membership details").child(uid)
        
        ref.observe(DataEventType.value) { (snap) in
            print("snap1 = \(snap)")
            let event = snap.value as? [String:Any]
            print("event1 = \(event)")
            for (key1,value1) in event!
            {
                let ref =  db.child("Academic details").child("Membership details").child(uid).child(key1)
                
                print("key1:",key1)
                ref.observe(DataEventType.value) { (snap) in
                    print("snap2 = \(snap)")
                    let event = snap.value as? [String:Any]
                    print("event2 = \(event)")
                    let obj = Admindatamodel().membershipdata(data: (event as! [String:Any]!))
                    //(data:[String:Any])
                    
                    self.GuideArray2.append(obj)
                    print("subArray = \(self.GuideArray2.count)")
                    self.MembershipTableView.reloadData()
                    
                    
                }
            }
            
            
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
}
