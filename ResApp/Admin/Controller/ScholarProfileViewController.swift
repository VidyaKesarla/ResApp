//
//  ScholarProfileViewController.swift
//  
//
//  Created by IOSLevel-01 on 12/05/19.
//

import UIKit
import FirebaseDatabase

class ScholarProfileViewController: UIViewController {
@IBOutlet weak var scholarname: UILabel!
    
     @IBOutlet weak var researchworktitle: UILabel!
     @IBOutlet weak var synopsis: UILabel!
     @IBOutlet weak var speciality: UILabel!
     @IBOutlet weak var yor: UILabel!
     @IBOutlet weak var no_of_publ: UILabel!
    
    @IBOutlet weak var employmenttype: UILabel!
    @IBOutlet weak var journal_impact_factor: UILabel!
    @IBOutlet weak var usn: UILabel!
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var guidename: UILabel!
    
    @IBOutlet weak var schimage: UIImageView!
    
    var scholarBasic: [Admindatamodel] =  []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("scholar uid",appdelegate.uid!)
       // self.fetchBasicDetails(uid: appdelegate.uid!)

        // Do any additional setup after loading the view.
    }
    
    func fetchBasicDetails(uid: String){
        let db = Database.database().reference()
        let ref = db.child("FetchUserdetails").child("Scholars").child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")").child(uid)
        
        ref.observe(DataEventType.value) { (snap) in
            print("snap1 = \(snap)")
            let event = snap.value as? [String:Any]
            print("event1 = \(event)")
            for (key1,value1) in event!
            {
                let ref =  db.child("FetchUserdetails").child("Scholars").child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")").child(uid).child(key1)
                
                print("key1:",key1)
                ref.observe(DataEventType.value) { (snap) in
                    print("snap2 = \(snap)")
                    let event = snap.value as? [String:Any]
                    print("event2 = \(event)")
                    let obj = Admindatamodel().basicscholardata(data: (event as! [String:Any]!))
                    
                    self.scholarBasic.append(obj)
                    for i in self.scholarBasic{
                        self.scholarname.text = i.scholarname
                        //self.dob.text
                        self.usn.text = i.USN
                        self.no_of_publ.text = i.noofpublications as! String
                        
                        self.yor.text = i.yearofpassing
                        self.speciality.text = i.specialisation
                        self.synopsis.text = i.Synopsis_letter
                        self.researchworktitle.text = i.Research_work_title
                        self.employmenttype.text = i.Employmenttype
                        self.journal_impact_factor.text = i.Journal_impact_work
                        self.guidename.text = i.Guide_name
                        self.email.text = i.Email
                        
                    }
                    print("subArray = \(self.scholarBasic.count)")
                    //  self.tableView.reloadData()
                    //  self.guideName.text = guideBasic[inde]
                    
                    
                }
            }
            
            
        }
        
        
    }
    

}
