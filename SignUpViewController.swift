//
//  SignUpViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 19/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {
    var auth = Auth.auth()

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var dept: UITextField!
    @IBOutlet weak var role: UITextField!
    @IBOutlet weak var name: UITextField!
    
    @IBAction func Submit(_ sender: Any) {
        self.auth.createUser(withEmail: self.username.text!, password: self.password.text!) { (user, error) in
            if error != nil
            {
                //handle error
                print("error = \(error)")
            }
            else
            {
                guard let localid = user?.user.uid else
                {
                    return
                }
                self.registerwithlocaluid(uid: localid)
                
                print("the localid userid = \(user?.user.uid)")
            }
            
    }
    }
        func registerwithlocaluid(uid:String)
        {
            var obj = user()
            obj.Uid = uid
            obj.Name = self.name.text!
            obj.Role = self.role.text!
            obj.Dept = self.dept.text!
            obj.Username = self.username.text!
            obj.Password = self.password.text!
            
            
            
            self.createUser(userobj: obj, uid: uid)
            
        }
        
        func createUser(userobj:user,uid:String)
        {
            let obj = user()
            let db = Database.database().reference()
            print("the db = \(db)")
            let parent = db.child("Userdetails").child(uid)
            let childdata = parent.childByAutoId()
            let data = [ "Name": self.name.text!,"Role": self.role.text!,"Dept": self.dept.text!,"Username":self.username.text!,"Password": self.password.text!] as [String:Any]
            childdata.setValue(data)
            self.name.text! = ""
           self.role.text! = ""
            self.dept.text! = ""
            self.username.text! = ""
            self.password.text! = ""
            
         }
        
        
      
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        
        struct user{
            var Name:String?
            var Role:String?
            var Dept:String?
            var Username:String?
            var Password:String?
            var Uid:String?
            init(){
                
            }
            init(withdict dict:[String:AnyObject]){
                Name = dict["Name"] as? String ?? ""
                Role = dict["Role"] as? String ?? ""
                Dept = dict["Dept"] as? String ?? ""
                Username = dict["Username"] as? String ?? ""
                Password = dict["Password"] as? String ?? ""
                Uid = dict["Uid"] as? String ?? ""
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


/*
 //
 //  SignUpViewController.swift
 //  AttendanceApp
 //
 //  Created by chaitra on 30/03/19.
 //
 
 import UIKit
 import Firebase
 
 class SignUpViewController: UIViewController {
 
 var auth = Auth.auth()
 @IBOutlet var firstName: UITextField!
 
 @IBOutlet var lastName: UITextField!
 
 @IBOutlet var branch: UITextField!
 
 
 @IBOutlet var instituteName: UITextField!
 
 @IBOutlet var address: UITextField!
 
 @IBOutlet var contactNo: UITextField!
 
 @IBOutlet var emailId: UITextField!
 
 
 @IBOutlet var createPwd: UITextField!
 
 @IBOutlet var confirmPwd: UITextField!
 
 
 @IBAction func submitButton(_ sender: UIButton)
 {
 self.auth.createUser(withEmail: self.emailId.text!, password: self.confirmPwd.text!) { (user, error) in
 if error != nil
 {
 //handle error
 print("error = \(error)")
 }
 else
 {
 guard let localid = user?.user.uid else
 {
 return
 }
 self.registerwithlocaluid(uid: localid)
 
 print("the localid userid = \(user?.user.uid)")
 }
 }
 
 
 
 }
 
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
 
 
 struct alluser
 {
 var fname:String?
 var lname:String?
 var branch:String?
 var iname:String?
 var address:String?
 var contact:String?
 var uname:String?
 var createpwd:String?
 var pwd:String?
 var uid:String?
 var role:Int?
 
 
 init()
 {
 
 }
 
 init(withdict dict:[String:AnyObject])
 {
 fname = dict["fname"] as? String ?? ""
 lname = dict["lname"] as? String ?? ""
 branch = dict["branch"] as? String ?? ""
 iname = dict["iname"] as? String ?? ""
 address = dict["address"] as? String ?? ""
 contact = dict["contact"] as? String ?? ""
 uname = dict["uname"] as? String ?? ""
 createpwd = dict["createpwd"] as? String ?? ""
 pwd = dict["pwd"] as? String ?? ""
 uid = dict["userid"] as? String ?? ""
 role = dict["role"] as? Int ?? 0
 
 
 }
 }
 
 
 /*  struct alluser
 {
 var fname:String?
 var lname:String?
 var branch:String?
 var iname:String?
 var address:String?
 var contact:String?
 var uname:String?
 var createpwd:String?
 var pwd:String
 var uid:String?
 
 
 init()
 {
 
 }
 
 init(withdict dict:[String:AnyObject])
 {
 fname = dict["fname"] as? String ?? ""
 lname = dict["lname"] as? String ?? ""
 branch = dict["branch"] as? String ?? ""
 iname = dict["iname"] as? String ?? ""
 address = dict["address"] as? String ?? ""
 contact = dict["contact"] as? String ?? ""
 uname = dict["uname"] as? String ?? ""
 createpwd = dict["createpwd"] as? String ?? ""
 pwd = dict["pwd"] as? String ?? ""
 uid = dict["userid"] as? String ?? ""
 }
 
 }
 */
 
 

 
 
 
 
 
 */

