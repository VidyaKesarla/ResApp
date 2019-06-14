//
//  MembershipViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 29/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase

class MembershipViewController: UIViewController {
    @IBOutlet weak var from: UIDatePicker!
    
    
    let db = Database.database().reference()
    
//    var slno3:String?
//    var body:String?
//    var from3:String?
//    var to3:String?
//    var orgname:String?
  //  "from3":self.from.text,"to3":self.to3.text,
    @IBAction func save(_ sender: Any) {
        let parent = db.child("Academic details").child("Membership details").child("\(appdelegate.uid ?? "")").childByAutoId()
        let data = ["slno3": self.slno.text, "body":self.body.text,"orgname":self.instname.text] as [String:Any]
        parent.setValue(data)
        self.registerwithid()
    }
    
    @IBAction func journals(_ sender: UIButton) {
        self.performSegue(withIdentifier: "tojourn", sender: self)
        print("In next")
        
    }
    
    
    @IBOutlet weak var instname: UITextField!
    @IBOutlet weak var to: UIDatePicker!
    @IBOutlet weak var body: UITextField!
    @IBOutlet weak var slno: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: Any) {
    }
    
    func registerwithid(){
        let objdata = Admindatamodel()
        objdata.slno3 = self.slno.text!
      //  objdata.From3
        //objdata.to3
        objdata.body = self.body.text!
        objdata.instname = self.body.text!
      //  objdata.iinstname = self.instname.text!
        somearray.append(objdata)
    }
    
    
    struct membership{
        var Slno:String?
        var Body:String?
        var From:String?
        var To:String?
        var orgname:String?
        
        init(){
            
        }
        init(withdict dict:[String:AnyObject]){
            Slno = dict["Slno"] as? String ?? ""
            Body = dict["Body"] as? String ?? ""
            From = dict["From"] as? String ?? ""
            To = dict["To"] as? String ?? ""
            orgname = dict["orgname"] as? String ?? ""
            
    }
    
}
}
