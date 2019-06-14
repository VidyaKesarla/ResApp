//
//  addGuide2ViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 29/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class addGuide2ViewController: UIViewController {
    @IBOutlet weak var patents: UITextField!
    
    @IBAction func addConference(_ sender: Any) {
    }
    @IBAction func addJournal(_ sender: Any) {
    }
    @IBOutlet weak var projects: UITextField!
    @IBOutlet weak var fieldofexpertise: UITextField!
    @IBOutlet weak var award: UITextField!
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

    /*
     
     
     
     func registerwithlocaluid(uid:String)
     {
     var obj = alluser()
     obj.uid = uid
     obj.fname = self.firstName.text!
     obj.lname = self.lastName.text!
     obj.branch = self.branch.text!
     obj.iname = self.instituteName.text!
     obj.address = self.address.text!
     obj.contact = self.contactNo.text!
     obj.uname = self.emailId.text!
     obj.createpwd = self.createPwd.text!
     obj.pwd = self.confirmPwd.text!
     
     
     self.createuser(userobj: obj, uid: uid)
     
     }
     
     func createuser(userobj:alluser,uid:String)
     {
     let obj = alluser()
     let db = Database.database().reference()
     print("the db = \(db)")
     let parent = db.child("Userdetails").child(uid)
     let childdata = parent.childByAutoId()
     let data = [ "fname": self.firstName.text!,"lname": self.lastName.text!,"branch": self.branch.text!,"iname":self.instituteName.text!,"address": self.address.text!,"contact": self.contactNo.text!,"uname": self.emailId.text!,"createpwd": self.createPwd.text!,"pwd":self.confirmPwd.text!,"role":1, "number":2] as [String:Any]
     childdata.setValue(data)
     self.firstName.text = ""
     self.lastName.text = ""
     self.branch.text = ""
     self.instituteName.text = ""
     self.address.text = ""
     self.contactNo.text = ""
     self.emailId.text = ""
     self.createPwd.text = ""
     self.confirmPwd.text = ""
     }
     
     @IBAction func cancelButton(_ sender: UIButton)
     {
     self.firstName.text = ""
     self.lastName.text = ""
     self.branch.text = ""
     self.instituteName.text = ""
     self.address.text = ""
     self.contactNo.text = ""
     self.emailId.text = ""
     self.createPwd.text = ""
     self.confirmPwd.text = ""
     }
     
     
     override func viewDidLoad() {
     super.viewDidLoad()

 */

