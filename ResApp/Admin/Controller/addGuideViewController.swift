//
//  addGuideViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 29/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage


struct Guides {
    var Guidename:String?
    var Dob:String?
    var Gend:String?
    var Nationality:String?
    var Contactno:String?
    var Emailid:String?
    var Address:String?
    var Correspondence:String?
    var Employmenttype:String?
    var Award:String?
    var Fieldofexpertise:String?
    var Patents:String?
    var Projects:String?
    
}
struct GuideArr{
    var all = [Guides]()
}
var a:Guides?
var b:GuideArr?













class addGuideViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var guideImage: UIImageView!
    
    @IBOutlet weak var role: UITextField!
    //var uid:String?
    
    var auth = Auth.auth()
    var selectedYear:String?
    
    var selectedDept:String?
    var selected: String?
    var imagePicker = UIImagePickerController()
    @IBAction func upload(_ sender: UIButton) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tempUpload: UILabel!
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            tempUpload.isHidden = true
            guideImage.contentMode = .scaleAspectFit
            guideImage.image = pickedImage
            
            
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    
    @IBAction func save(_ sender: Any) {
       // let obj = self.registerwithlocaluid()
      //  print("due to button")
      //  print("\(String(describing: obj.Guidename))")
        
        //  print("due to button")
        //  print("\(String(describing: obj.Guidename))")
        
        if self.guideImage.image != nil
        {
            //            self.activitystart()
            if let uploadData = self.guideImage.image!.pngData()
            {
                let imageName = NSUUID().uuidString
                
                
                let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).png")
                
                
                DispatchQueue.main.async {
                    storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                        
                        print("the error is  = \(error)")
                        if error != nil
                        {
                            print("control enterd into the error part")
                            // self.activitystop()
                            let alert = UIAlertController(title: "Error", message: (error?.localizedDescription), preferredStyle: .alert)
                            
                            let ok  = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                                
                                let user = Auth.auth().currentUser
                                print("created user email = \(String(describing: user?.email!))")
                                user?.delete(completion: { (error) in
                                    if let error = error {
                                      //  self.customAlert(title: "Error While Deleting User", message: error.localizedDescription, buttonTitle: "OK")
                                    } else {
                                        
                                        //self.customAlert(title: "Success", message: "User Deleted Create New User", buttonTitle: "OK")
                                        // Account deleted.
                                    }
                                })
                                
                            })
                            alert.addAction(ok)
                            
                            
                            
                            //self.activitystop()
                            return
                        }
                        else
                        {
                            storageRef.downloadURL(completion: { (url, error) in
                                print("image URL: \((url?.absoluteString)!)")
                                if let profileImageUrl = url?.absoluteString
                                {
                                    let values = ["profileurl": profileImageUrl]
                                //    self.registerImg(values: values as [String : AnyObject])
                                }
                            })
                        }
                        
                        
                        
                        
                    })
                }
                
            }
        }
       // print(a as Any)
        self.auth.createUser(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
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
        
        
    
       //self.performSegue(withIdentifier: "1to6", sender: self)
        
    }
    func registerwithlocaluid(uid:String)
    {
        var objdata = newGuide()
        
        
        objdata.Guidename = self.guideName.text
        //  objdata.Dob = self.dob.tex
        objdata.Gend = self.gender.text
        objdata.Nationality = self.nationality.text
        objdata.Contactno = self.address.text
        objdata.Emailid = self.email.text
        objdata.Address = self.address.text
        // obj.createpwd = self.createPwd.text!
        objdata.Employmenttype = self.employmenttype.text
        objdata.Correspondence = self.correspondence.text
        objdata.Award = self.award.text
        objdata.Fieldofexpertise = self.foe.text
        objdata.Patents = self.patents.text
        objdata.Projects = self.projects.text
        objdata.uid = uid
        objdata.role = 1
        
        
        self.createUser(userobj: objdata, uid: uid)
        
    }

    func createUser(userobj:newGuide,uid:String)
    {
        let obj = newGuide()
        let db = Database.database().reference()
        print("the db = \(db)")
        let parent = db.child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")").child(uid)
        let parent2 = db.child("Userdetails").child(uid)
        let id1 = parent.childByAutoId().key
        let parentobj = parent.child(id1!)
        let childdata2 = parent2.childByAutoId()
        //let childdata = parent.childByAutoId()
        let data = [ "guidename": self.guideName.text!, "gender": self.gender.text!, "nationality": self.nationality.text!, "contactno": self.contactno.text!,"emailid": self.email.text!, "address": self.address.text!,"correspondence": self.correspondence.text!, "employment type": self.employmenttype.text!,"award":self.award.text!, "fieldofexpertise": self.foe.text!, "patents": self.patents.text!, "projects": self.projects.text!,"uid": uid, "role":1,"autoID":id1,"profileurl": userobj.profileurl] as [String:Any]
        let data1 = ["emailid":self.email.text,"role":1,"name":self.guideName.text,"dept":appdelegate.dept!] as [String : Any]
        parentobj.setValue(data)
        childdata2.setValue(data1)
        self.guideImage.image = nil
        print("inserted")

        
        self.FetchcreateUser(userobj: userobj, uid: uid)
    }
    
    func FetchcreateUser(userobj:newGuide,uid:String)
    {
        _ = newGuide()
        let db = Database.database().reference()
        print("the db = \(db)")
        let parent = db.child("FetchUserdetails").child("Guide").child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")").child(uid)
       // let childdata = parent.childByAutoId()
        let id1 = parent.childByAutoId().key
        let parentobj = parent.child(id1!)
        let data = [ "guidename": self.guideName.text!, "gender": self.gender.text!, "nationality": self.nationality.text!, "contactno": self.contactno.text!,"emailid": self.email.text!, "address": self.address.text!,"correspondence": self.correspondence.text!, "employment type": self.employmenttype.text!,"award":self.award.text!, "fieldofexpertise": self.foe.text!, "patents": self.patents.text!, "projects": self.projects.text!, "uid": uid, "role":1,"autoID":id1,"profileurl": userobj.profileurl] as [String:Any]
        parentobj.setValue(data)
        self.guideImage.image = nil
        print("inserted")

        
    }
    
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var correspondence: UITextField!
    
    @IBOutlet weak var employmenttype: UITextField!
    @IBOutlet weak var permanentaddress: UITextField!
    
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var projects: UITextField!
    @IBOutlet weak var patents: UITextField!
    @IBOutlet weak var foe: UITextField!
    @IBOutlet weak var award: UITextField!
 
    @IBOutlet weak var email: UITextField!
   
    @IBOutlet weak var contactno: UITextField!
    
    @IBOutlet weak var nationality: UITextField!
    
    @IBOutlet weak var gender: UITextField!
    
    @IBOutlet weak var guideName: UITextField!
    
    @IBOutlet weak var dob: UIDatePicker!
    
    
    @IBAction func addEducation(_ sender: Any) {
//        self.performSegue(withIdentifier: "edn", sender: self)
        self.registerwithlocaluid()
        
//appdelegate.aone = a
        //a = obj
       // print("due to button")
        //print("\(String(describing: obj.Guidename))")
        
        
        
    }
    
    func registerwithlocaluid()
    {
       
        //somearray.append(objdata)
       // self.clearvalues()
        //DO NOT DELETE: CODE FOR STORING STRUCT DATA TEMPORARILY IN APP DELEGATE FOR PASSSING 6 VCs DATA :O
        //va = Guides()
//        appdelegate.aone.Guidename = self.guideName.text!
//        // obj.Dob = self.dob.String==
//        appdelegate.aone.Gend = self.gender.text!
//        appdelegate.aone.Nationality = self.nationality.text!
//        appdelegate.aone.Contactno = self.address.text!
//        appdelegate.aone.Emailid = self.email.text!
//        appdelegate.aone.Address = self.address.text!
//        // obj.createpwd = self.createPwd.text!
//        appdelegate.aone.Employmenttype = self.employmenttype.text!
//        appdelegate.aone.Correspondence = self.correspondence.text!
//        appdelegate.aone.Award = self.award.text!
//        appdelegate.aone.Fieldofexpertise = self.foe.text!
//        appdelegate.aone.Patents = self.patents.text!
//        appdelegate.aone.Projects = self.projects.text!
//        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "1to6"{
        let cv = segue.destination as? ConferencesViewController
            let obj = newGuide()
    print("hi")
            cv?.basic = a
                        //cv?.guide = b
            print("ok")


        }
        else{
            print("none")
        }


    }
   override func viewDidLoad() {
        super.viewDidLoad()
    print(selectedYear)
      imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
   // let appdelegate = UIApplication.shared.delegate as! AppDelegate

//        let obj = self.registerwithlocaluid()
//        let name = obj.Guidename
//        print(name!)

        // Do any additional setup after loading the view.
    }
    
    struct guide{
        var all = [newGuide]()
    }
   
    }
struct newGuide {
    var Guidename:String?
    var Dob:String?
    var Gend:String?
    var Nationality:String?
    var Contactno:String?
    var Emailid:String?
    var Address:String?
    var Correspondence:String?
    var Employmenttype:String?
    var Award:String?
    var Fieldofexpertise:String?
    var Patents:String?
    var Projects:String?
    var uid:String?
    var password: String?
    var role: Int?
    var profileurl: String?
    
    //
    init()
    {
        //
    }
    //
    init(withdict dict:[String:AnyObject])
    {
        Guidename = dict["Guidename"] as? String ?? ""
        Dob = dict["Dob"] as? String ?? ""
        Gend = dict["Gend"] as? String ?? ""
        Nationality = dict["Nationality"] as? String ?? ""
        Contactno = dict["Contactno"] as? String ?? ""
        Emailid = dict["Emailid"] as? String ?? ""
        Address = dict["Address"] as? String ?? ""
        Correspondence = dict["Correspondence"] as? String ?? ""
        Employmenttype = dict["Employmenttype"] as? String ?? ""
        Award = dict["Award"] as? String ?? ""
        Fieldofexpertise = dict["Fieldofexpertise"] as? String ?? ""
        Patents = dict["Patents"] as? String ?? ""
        Projects = dict["Projects"] as? String ?? ""
        uid = dict["uid"] as? String ?? ""
        password = dict["password"] as? String ?? ""
        role = dict["role"] as? Int ?? 1
        profileurl = dict["profileurl"] as?  String ?? ""
    }
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  




//
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//
//    // Do any additional setup after loading the view.
//}
//
//
///*
// // MARK: - Navigation
//
// // In a storyboard-based application, you will often want to do a little preparation before navigation
// override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
// // Get the new view controller using segue.destination.
// // Pass the selected object to the new view controller.
// }
// */
//

//}
//
//

}
