//
//  AddEducationViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 09/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class AddEducationViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guideList.count
    }
    @IBOutlet weak var guideImage: UIImageView!
    @IBOutlet weak var projects: UILabel!
    
    @IBOutlet weak var patents: UILabel!
    @IBOutlet weak var fieldofexpertise: UILabel!
    @IBOutlet weak var award: UILabel!
    
    @IBOutlet weak var employmenttype: UILabel!
    @IBOutlet weak var correspondence: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var emailID: UILabel!
    @IBOutlet weak var Contactno: UILabel!
    @IBOutlet weak var Nationality: UILabel!
    
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var guideName: UILabel!
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! EducationTableViewCell
        //print("slnooooooo","\(guideList[indexPath.row].Slno1)")
        print("degreee","\(guideList[indexPath.row].degree)")
//        self.guideName.text = guideBasic[indexPath.row].Guidename
//        //self.dob.text
//        self.gender.text = guideBasic[indexPath.row].Gend
//self.Nationality.text = guideBasic[indexPath.row].Nationality
//        self.Contactno.text = guideBasic[indexPath.row].Contactno
//        self.emailID.text = guideBasic[indexPath.row].Emailid
//        self.address.text = guideBasic[indexPath.row].Address
//        self.correspondence.text = guideBasic[indexPath.row].Correspondence
//        self.employmenttype.text = guideBasic[indexPath.row].Employmenttype
//        self.award.text = guideBasic[indexPath.row].Award
//        self.fieldofexpertise.text = guideBasic[indexPath.row].Fieldofexpertise
//    //self.patents.text = guideBasic[indexPath.row].//
        
        cell.slno.text = guideList[indexPath.row].slno1
        cell.degree.text = guideList[indexPath.row].degree
        cell.branch.text = guideList[indexPath.row].branch
        cell.specialisation.text = guideList[indexPath.row].specialisation
        cell.yop.text = guideList[indexPath.row].yearofpassing
        
        cell.university.text = guideList[indexPath.row].university
        return cell
        
    }
    
    @IBOutlet weak var tableViewEdn: UITableView!
    var guideList: [Admindatamodel] =  []
     var guideBasic: [Admindatamodel] =  []
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchEducationDetails(uid: appdelegate.uid!)
    self.fetchBasicDetails(uid: appdelegate.uid!)
            
    
        // Do any additional setup after loading the view.
    }
    
    func fetchEducationDetails(uid: String){
            let db = Database.database().reference()
            let ref = db.child("Academic details").child("Education details").child(uid)
        
        ref.observe(DataEventType.value) { (snap) in
            print("snap1 = \(snap)")
            let event = snap.value as? [String:Any]
            print("event1 = \(event)")
            for (key1,value1) in event!
            {
                let ref =  db.child("Academic details").child("Education details").child(uid).child(key1)
                
                print("key1:",key1)
                ref.observe(DataEventType.value) { (snap) in
                    print("snap2 = \(snap)")
                    let event = snap.value as? [String:Any]
                     print("event2 = \(event)")
                    let obj = Admindatamodel().educationdata(data: (event as! [String:Any]!))
                    
                    self.guideList.append(obj)
                    print("subArray = \(self.guideList.count)")
                    self.tableView.reloadData()
                    
                    
                }
            }
            
            
        }
        
               
        }
    
    func fetchBasicDetails(uid: String){
        let db = Database.database().reference()
        let ref = db.child("FetchUserdetails").child("Guide").child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")").child(uid)
        
        ref.observe(DataEventType.value) { (snap) in
            print("snap1 = \(snap)")
            let event = snap.value as? [String:Any]
            print("event1 = \(event)")
            for (key1,value1) in event!
            {
                let ref =  db.child("FetchUserdetails").child("Guide").child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")").child(uid).child(key1)
                
                print("key1:",key1)
                ref.observe(DataEventType.value) { (snap) in
                    print("snap2 = \(snap)")
                    let event = snap.value as? [String:Any]
                    print("event2 = \(event)")
                    let obj = Admindatamodel().basicguidedate(data: (event as! [String:Any]!))
                    
                    self.guideBasic.append(obj)
                    for i in self.guideBasic{
                        self.guideName.text = i.Guidename
                                //self.dob.text
                                self.gender.text = i.Gend
                        self.Nationality.text = i.Nationality
                                self.Contactno.text = i.Contactno
                                self.emailID.text = i.Emailid
                                self.address.text = i.Address
                                self.correspondence.text = i.Correspondence
                                self.employmenttype.text = i.Employmenttype
                                self.award.text = i.Award
                                self.fieldofexpertise.text = i.Fieldofexpertise
                        self.patents.text = i.Patents
                        self.projects.text = i.Projects
                    }
                    print("subArray = \(self.guideList.count)")
                  //  self.tableView.reloadData()
                  //  self.guideName.text = guideBasic[inde]
                    
                    
                }
            }
            
            
        }
        
        
    }
    

}

