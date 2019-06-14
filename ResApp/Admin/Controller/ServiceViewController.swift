//
//  ServiceViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 29/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase

class ServiceViewController: UIViewController {
    @IBOutlet weak var from: UIDatePicker!
    let db = Database.database().reference()
   
    @IBAction func memberships(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "memberships", sender: self)
    }
    
    @IBAction func save(_ sender: Any) {
        let parent = db.child("Academic details").child("Service details").child("\(appdelegate.uid ?? "")").childByAutoId()
        let data = ["slno2": self.slno.text, "nOY":self.noofyears.text,"degree2":self.degree.text,"designation":self.destination.text,"instname":self.nameoftheinstitute.text] as [String:Any]
        parent.setValue(data)
        self.registerwithid()
    }
    @IBOutlet weak var nameoftheinstitute: UITextField!
    @IBOutlet weak var destination: UITextField!
    @IBOutlet weak var degree: UITextField!
    @IBOutlet weak var noofyears: UITextField!
    @IBOutlet weak var to: UIDatePicker!
    @IBOutlet weak var slno: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    
    func registerwithid(){
        let objdata = Admindatamodel()
        objdata.slno2 = self.slno.text!
      //  objdata.From2 = self.from.text!
        //objdata.To2 = self.to.textInputMode
        objdata.degree2 = self.degree.text!
        objdata.designation = self.destination.text!
        objdata.instname = self.nameoftheinstitute.text!
        objdata.nOY = self.noofyears.text!
        somearray.append(objdata)
    }

    struct service{
        var Slno:String?
        var From:String?
        var To:String?
        var NOY:String?
        var Degree:String?
        var Designation:String?
        var Instname:String?
        init(){
            
        }
        init(withdict dict:[String:AnyObject]){
            Slno = dict["Slno"] as? String ?? ""
            From = dict["From"] as?
            String ?? ""
            To = dict["To"] as?
                String ?? ""
            NOY = dict["NOY"] as?
                String ?? ""
            Degree = dict["Degree"] as?
                String ?? ""
            Designation = dict["Designation"] as?
                String ?? ""
            Instname = dict["Instname"] as?
                String ?? ""
        }
    }
}
