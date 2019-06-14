//
//  ConferencesViewController.swift
//  ResApp
//
//  Created by IOSLevel01 on 08/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class ConferencesViewController: UIViewController {
    var basic:Guides?
    var guide:GuideArr?
    var selectedYear: String?
    var selectedDept: String?
    let app = UIApplication.shared.delegate as! AppDelegate
     let db = Database.database().reference()
    @IBOutlet weak var dept: UITextField!
    @IBOutlet weak var papertitle: UITextField!
    @IBOutlet weak var citation: UITextField!
    @IBOutlet weak var publisher: UITextField!
    @IBOutlet weak var conferencename: UITextField!
    @IBOutlet weak var coauthorname: UITextField!
    @IBOutlet weak var slno: UITextField!
    //    var Slno5:String?
    //    var Coauthorname5:String?
    //    var Papertitle5:String?
    //    var Confname:String?
    //    var Publisher5:String?
    //    var Citation5:String?
    
    
    @IBAction func home(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "scholarStoryboard", bundle: nil)
        let dest = storyboard.instantiateViewController(withIdentifier :"adminlogin") as! selectViewController
        
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let nav = UINavigationController(rootViewController: dest)
        appdelegate.window?.rootViewController = nav
    }
    
    func registerwithid(){
        let objdata = Admindatamodel()
        objdata.Slno5 = self.slno.text!
        objdata.Coauthorname5 = self.coauthorname.text!
        objdata.Papertitle5 = self.papertitle.text!
        objdata.Confname = self.conferencename.text!
        objdata.Publisher5 = self.publisher.text!
        objdata.Citation5 = self.citation.text!
        somearray.append(objdata)
    }
    @IBAction func submit(_ sender: Any) {
        let parent = db.child("Academic details").child("Conferences details").child("\(appdelegate.uid ?? "")").childByAutoId()
        let data = ["Slno5": self.slno.text, "Coauthorname5":self.coauthorname.text,"Papertitle5":self.papertitle.text,"Confname":self.conferencename.text,"Publisher5":self.publisher.text,"Citation5":self.citation.text] as [String:Any]
        parent.setValue(data)

       // let obj = alluser()
      //  let vc = addGuideViewController()
      //  let fetchobj = Admindatamodel()
       // self.retrivedata(data: somearray)
      //  print("appdelegate.Edn.all====\(appdelegate.Edn.all)")
        //"edn2": appdelegate.Edn.all[1].Slno
    }
    
    
//    func retrivedata(data:[Admindatamodel])
//    {
//       for mydata in data
//       {
//        print("the val slno is = \(mydata.Slno1)")
//        print("the val slno is = \(mydata.Degree1)")
//        print("\(mydata.Branch)")
//        print("\(mydata.Specialisation)")
//       print("\(mydata.YOP)")
//        print("\(mydata.University)")
//
//        let auth = Auth.auth()
//        auth.createUser(withEmail: "vkesarla1997@gmail.com", password: "abcd") { (user, error) in
//            if error != nil
//            {
//                let uid = user?.user.uid
//                print("userid = \(uid)")
//            }
//        }
//
//
//        let parent = db.child("YEAR").child("dEPT").child("guide").child("uid")
//        let childdata = parent.childByAutoId()
//        let data = ["guidename": mydata.Guidename, "gender": mydata.Gend, "nationality": mydata.Nationality, "contactno": mydata.Contactno,"emailid": mydata.Emailid, "address": mydata.Address,"correspondence": mydata.Correspondence, "employment type": mydata.Employmenttype,"award":mydata.Award, "fieldofexpertise": mydata.Fieldofexpertise, "patents": mydata.Patents, "projects": mydata.Projects] as [String:Any]
//        childdata.setValue(data)
//        //educationdetails
//        let parent2 = parent.child("Education details")
//        let data2 = ["slno1": mydata.Slno1, "degree":mydata.Degree1 ,"branch": mydata.Branch, "specialisation": mydata.Specialisation,"year of passing": mydata.YOP, "university": mydata.University] as [String:Any]
//        //let childdata2 = parent2.childByAutoId()
//        parent2.setValue(data2)
//        //servicedetails
//        let parent3 = parent.child("Service details")
//        let data3 = ["slno22": mydata.Slno2, "from2":mydata.From2,"to2":mydata.To2, "noofyears":mydata.NOY,"degree":mydata.Degree2,"designation":mydata.Designation,"institutename":mydata.Instname] as [String:Any]
//        //let childdata3 = parent3.childByAutoId()
//        parent3.setValue(data3)
//        //membershipdetails
//        let parent4 = parent.child("Membership details")
//        let data4 = ["slno3":mydata.Slno3,"body":mydata.Body,"from3":mydata.From3,"to3":mydata.To3,"orgname":mydata.orgname] as [String:Any]
//       // let childdata4 = parent4.childByAutoId()
//        parent4.setValue(data4)
//        //journal details
//        let parent5 = parent.child("Journal details")
//        let data5 = ["slno4":mydata.Slno4,"coauthorname":mydata.Coauthorname4,"papertitle":mydata.Papertitle4,"journalname":mydata.Journalname,"publisher4":mydata.Publisher4,"citation4":mydata.Citation4] as [String:Any]
//       // let childdata5 = parent5.childByAutoId()
//          parent5.setValue(data5)
//        //conferences details
//        let parent6 = parent.child("Conferences details")
//        let data6 = ["slno5":mydata.Slno5,"coauthorname":mydata.Coauthorname5,"papertitle":mydata.Papertitle5,"conferencename":mydata.Confname,"publisher":mydata.Publisher5,"citation5":mydata.Citation5] as [String:Any]
//       // let childdata6 = parent6.childByAutoId()
//        parent6.setValue(data6)
//      //  retrivedata(data: somearray)
//        print("data inseted successfully")
////     "guidename": mydata.Guidename!, "gender": mydata.Gend!, "nationality": mydata.Nationality!, "contactno": mydata.Contactno!,"emailid": mydata.Emailid!, "address": mydata.Address!,"correspondence": mydata.Correspondence!, "employment type": mydata.Employmenttype!,"award":mydata.Award!, "fieldofexpertise": mydata.Fieldofexpertise!, "patents": mydata.Patents!, "projects": mydata.Projects!, "dob":mydata.Dob"dob":mydata.Dob ,, "slno1": mydata.Slno1, "degree":mydata.Degree1 "branch": mydata.Branch!, "specialisation": mydata.Specialisation!, "year of passing": mydata.YOP!, "university": mydata.University! , "slno22": mydata.Slno2, "from2":mydata.From2,"to2":mydata.To2, "noofyears":mydata.NOY,"degree":mydata.Degree2,"designation":mydata.Designation,"institutename":mydata.Instname,"slno3":mydata.Slno3,"body":mydata.Body,"from3":mydata.From3,"to3":mydata.To3,"orgname":mydata.orgname,"slno4":mydata.Slno4,"coauthorname":mydata.Coauthorname4,"papertitle":mydata.Papertitle4,"journalname":mydata.Journalname,"publisher4":mydata.Publisher4,"citation4":mydata.Citation4,"slno5":mydata.Slno5,"coauthorname":mydata.Coauthorname5,"papertitle":mydata.Papertitle5,"conferencename":mydata.Confname,"publisher":mydata.Publisher5,"citation5":mydata.Citation5
////       }
//    }
//    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print(appdelegate.aone.Guidename)
        print("i am in conf vc")
        print(basic)
        print(basic?.Address)
        print("yessss")
        // Do any additional setup after loading the view.
    }
    struct conferences{
        var Slno:String?
        var Coauthorname:String?
        var Papertitle:String?
        var Confname:String?
        var Publisher:String?
        var Citation:String?
        init(){
        }
        init(withdict dict:[String:AnyObject]){
            Slno = dict["Slno"] as? String ?? ""
            Coauthorname = dict["Coauthorname"] as? String ?? ""
            Papertitle = dict["Papertitle"] as? String ?? ""
            Confname = dict["Confname"] as? String ?? ""
            Publisher = dict["Publisher"] as? String ?? ""
            Citation = dict["Citation"] as? String ?? ""
        }
    }
}
