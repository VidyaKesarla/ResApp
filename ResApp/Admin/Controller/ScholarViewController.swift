//
//  ScholarViewController.swift
//  ResApp
//
//  Created by IOSLevel01 on 08/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class ScholarViewController: UIViewController,UIPopoverPresentationControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var auth = Auth.auth()
    var guideautoid:String?
  var GuideArray:[Admindatamodel] = []
    var publndata:[Admindatamodel] = []
    
    var prevnoofpubs:Int = 0
    var tempno:Int = 0
    struct newScholar{
        var SchName: String?
        var USN: String?
        var Yor: String?
        var Specialization: String?
        var Number_of_Publications: String?
        var Synopsis_letter : String?
        var Research_work_title: String?
        var Journal_impact_work: String?
        var Type_of_enrollment: String?
        var Guide_name: String?
        var Email: String?
        var Password: String?
        var Role: Int?
        var guideuid: String?
        var profileurl:String?
        
        
    
    init()
    {
        //
    }
    //
    init(withdict dict:[String:AnyObject])
    {
        SchName = dict["SchName"] as? String ?? ""
        USN = dict["USN"] as? String ?? ""
        Yor = dict["Yor"] as? String ?? ""
        Specialization = dict["Specialization"] as? String ?? ""
        Number_of_Publications = dict["Number_of_Publications"] as? String ?? ""
        Synopsis_letter = dict["Synopsis_letter"] as? String ?? ""
        Research_work_title = dict["Research_work_title"] as? String ?? ""
        Journal_impact_work = dict["Journal_impact_work"] as? String ?? ""
        Type_of_enrollment = dict["Type_of_enrollment"] as? String ?? ""
        Guide_name = dict["Guide_name"] as? String ?? ""
        Password = dict["Password"] as? String ?? ""
        profileurl = dict["profileurl"] as? String ?? ""
        Role = dict["Role"] as? Int ?? 2
    }
    }
    
    var prevvalue:Int = 0
    
    
    
    @IBOutlet weak var scholarimage: UIImageView!
    @IBOutlet weak var schName: UITextField!
    
    @IBOutlet weak var schspecialization: UITextField!
    
    @IBOutlet weak var schrole: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var schemail: UITextField!
    @IBOutlet weak var schguidename: UITextField!
    @IBOutlet weak var typeofenrolment: UITextField!
   
    @IBOutlet weak var impactfactor: UITextField!
    @IBOutlet weak var restitle: UITextField!
    @IBOutlet weak var synopsis: UITextField!
    @IBOutlet weak var schpub: UITextField!
    @IBOutlet weak var schusn: UITextField!
    
    @IBOutlet weak var schregyear: UITextField!
    
    @IBAction func chooseGuide(_ sender: UIButton) {
        let popControl = UIStoryboard(name: "AdminStoryboard", bundle: nil).instantiateViewController(withIdentifier: "guideNamePop") as! GuidePopUpViewController
        popControl.modalPresentationStyle =   UIModalPresentationStyle.popover
        popControl.preferredContentSize.width = self.view.frame.size.width / 3
        popControl.preferredContentSize.height = self.view.frame.size.height / 5
        //popControl.delegate  = self;
        popControl.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        
        popControl.popoverPresentationController?.delegate = self
        popControl.popoverPresentationController?.sourceView = sender as? UIView
        
        
        popControl.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
        
        self.present(popControl, animated: true, completion: nil)
        
        
        
    }
    @IBAction func Addsubject(_ sender: Any) {
    }
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
            scholarimage.contentMode = .scaleAspectFit
            scholarimage.image = pickedImage
            
            
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    @IBAction func submitTT(_ sender: UIButton) {
        
    }
  
  
    func customAlert(title:String,message:String,buttonTitle:String)
    {
        let alertcontrollerc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alertcontrollerc, animated: false, completion: nil)
        let okbutton = UIAlertAction(title: buttonTitle, style: .destructive, handler: nil)
        alertcontrollerc.addAction(okbutton)
    }
    
    
    
    //self.performSegue(withIdentifier: "1to6", sender: self)
    
    
    func registerImg(values: [String: AnyObject]) {
        // let ref = Database.database().reference()
        // let usersReference = ref.child("users").child(uid)
        
        var alluser = newScholar()
        alluser.profileurl = values["profileurl"] as? String
        
        
        self.createUser(userobj: alluser, uid: appdelegate.uid!)
        
        
        
        // FirebaseStuctureCustomVM().createUserDetails(userdetails: userD)
        
    }
    
    
    
    func registerwithlocaluid( uid:String?)
    {
        var objdata = newScholar()
        
        
        //            var SchName: String?
        //            var USN: String?
        //            var Yor: String?
        //            var Specialization: String?
        //            var Number_of_Publications: String?
        //            var Synopsis_letter : String?
        //            var Research_work_title: String?
        //            var Journal_impact_work: String?
        //            var Type_of_enrollment: String?
        //            var Guide_name: String?
        //            var Email: String?
        //            var Password: String?
        //            var Role: String?
        //              @IBOutlet weak var schName: UITextField!
        
        //            @IBOutlet weak var schspecialization: UITextField!
        //
        //            @IBOutlet weak var schrole: UITextField!
        //            @IBOutlet weak var password: UITextField!
        //            @IBOutlet weak var schemail: UITextField!
        //            @IBOutlet weak var schguidename: UITextField!
        //            @IBOutlet weak var typeofenrolment: UITextField!
        //            @IBOutlet var impactfactor: UIView!
        //            @IBOutlet weak var restitle: UITextField!
        //            @IBOutlet weak var synopsis: UITextField!
        //            @IBOutlet weak var schpub: UITextField!
        //            @IBOutlet weak var schusn: UITextField!
        //
        //            @IBOutlet weak var schregyear: UITextField!
        
        objdata.SchName = self.schName.text
        //  objdata.Dob = self.dob.tex
        objdata.USN = self.schusn.text
        objdata.Yor = self.schregyear.text
        objdata.Specialization = self.schspecialization.text
        objdata.Number_of_Publications = self.schpub.text
        objdata.Synopsis_letter = self.synopsis.text
        // obj.createpwd = self.createPwd.text!
        objdata.Type_of_enrollment = self.typeofenrolment.text
       // objdata.Guide_name = self.schguidename.text
        objdata.Email = self.schemail.text
        objdata.Password = self.password.text
        objdata.Role = 2
        
        
        
        
        self.createUser(userobj: objdata, uid: uid!)
        
    }
    
    func createUser(userobj:newScholar,uid:String)
    {
        var obj = newScholar()
        let db = Database.database().reference()
        print("the db = \(db)")
        let parent = db.child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")").child(uid)
       // let childdata = parent.childByAutoId()
        let parent2 = db.child("Userdetails").child(uid)
        let childdata2 = parent2.childByAutoId()
        let id1 = parent.childByAutoId().key
        let parentobj = parent.child(id1!)
       // obj.guideuid = appdelegate.uid
        let data = [ "scholarname": self.schName.text!, "usn": self.schusn.text!, "year of reg": self.schregyear.text!, "specialization": self.schspecialization.text!,"noofpublications": self.schpub.text!, "synopsis letter": self.synopsis.text!,"Type of enrollment": self.typeofenrolment.text!,"guidename":appdelegate.guidename,"guide uid": appdelegate.uid, "Email":self.schemail.text!, "Password": self.password.text!, "Role": 2, "uid": uid, "role":self.schrole,"autoid":id1,"profileurl": userobj.profileurl,"dept":appdelegate.dept!] as [String:Any]
        parentobj.setValue(data)
        let data1 = ["emailid":self.schemail.text,"role":2,"name":self.schName.text,"dept":appdelegate.dept!] as [String : Any]
       // childdata.setValue(data)
        childdata2.setValue(data1)
        self.scholarimage.image = nil
        print("inserted")
        
        
        self.FetchcreateUser(userobj: userobj, uid: uid)
    }
    
    func FetchcreateUser(userobj:newScholar,uid:String)
    {
        _ = newScholar()
        let db = Database.database().reference()
        print("the db = \(db)")
        let parent = db.child("FetchUserdetails").child("Scholars").child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")").child(uid)
       // let childdata2 = parent2.childByAutoId()
        let id1 = parent.childByAutoId().key
        let parentobj = parent.child(id1!)
       // let parent2 = db.
       // let childdata = parent.childByAutoId()
        print("guide",appdelegate.guidename)
        print("guideuid",appdelegate.uid)
        let data = [ "scholarname": self.schName.text!, "usn": self.schusn.text!, "year of reg": self.schregyear.text!, "specialization": self.schspecialization.text!,"noofpublications": self.schpub.text!, "synopsis letter": self.synopsis.text!,"Type of enrollment": self.typeofenrolment.text!,"guidename": appdelegate.guidename,"guide uid": appdelegate.uid,"Email":self.schemail.text!, "Password": self.password.text!, "Role": 2, "uid": uid,"autoid":id1,"dept":appdelegate.dept!] as [String:Any]
         parentobj.setValue(data)
        print("yearrrrr","\(appdelegate.year ?? "")")
        print("depppttt","\(appdelegate.dept ?? "")")
        print("uiiiididd","\(appdelegate.uid ?? "")")
        print("guideautoid",guideautoid)
        self.fetchGuides(year: appdelegate.year!, dept: appdelegate.dept!)
        
        let parent2 = db.child("FetchUserdetails").child("Guide").child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")").child("\(appdelegate.uid ?? "")").child(guideautoid!).child("scholars")
        let auto = parent2.childByAutoId().key
       let parent2obj = parent2.child(auto!)
        self.prevnoofpubs = self.validatedint! + Int(self.schpub.text!)!
      //  print("prev",self.finalfetch())
        print("now",Int(self.schpub.text!)!)
        print("summm",prevnoofpubs)
        let parent3 = db.child("No of publications").child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")")

            appdelegate.unique = parent3.childByAutoId().key
                let parent4 = parent3.child(appdelegate.unique!)
                    
            
           // .child("\(appdelegate.dept ?? "")")
        
        var data3 = ["dept":"\(appdelegate.dept ?? "")","noofpublications":prevnoofpubs] as [String:Any]
        let pubdata1 = ["noofpublications":prevnoofpubs]
        var pubdata2 = ["dept":"\(appdelegate.dept ?? "")"] as [String : Any]
        parent3.updateChildValues(pubdata1)
        parent3.updateChildValues(pubdata2)
//
//        let storyboard = UIStoryboard(name: "Principal", bundle: nil)
//        ////                let controller = storyboard.instantiateViewController(withIdentifier: "admin")
//        ////                self.present(controller, animated: false, completion: nil)
//        let VC = storyboard.instantiateViewController(withIdentifier: "principallogin") as! BarChartsYearViewController
//        VC.publicdata.append(prevnoofpubs)
       
        let data2 = ["scholaruid":uid,"scholarname":self.schName.text] as [String : Any]
       print("scholar added to guide")
        parent2obj.setValue(data2)
        
        
    }
    
        
        
    
    func fetchGuides(year: String, dept: String)
    {
        let db = Database.database().reference()
        let ref = db.child("FetchUserdetails").child("Guide").child(year).child(dept)
        
        // print("year = \(appdelegate.year)")
        //print("dept = \(appdelegate.dept)")
        //observing the data changes
        ref.observe(DataEventType.value) { (snapshot) in
            // print("snap = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            //print("event = \(event)")
            for (key,value) in event!
            {
                let ref = db.child("FetchUserdetails").child("Guide").child(year).child(dept).child(key)
                
                
                ref.observe(DataEventType.value) { (snap) in
                    // print("snap2 = \(snap)")
                    let event = snap.value as? [String:Any]
                    //print("event2 = \(event)")
                    for (key1,value1) in event!
                    {
                        let ref =
                            db.child("FetchUserdetails").child("Guide").child(year).child(dept).child(key).child(key1)
                        
                        
                        ref.observe(DataEventType.value) { (snap) in
                            print("snap1 = \(snap)")
                            let event = snap.value as? [String:Any]
                            //   print("event1 = \(event)")
                            let obj = Admindatamodel().basicguidedate(data: (event as! [String:Any]))
                            print("autoid",obj.autoid)
                            
                            
                            self.GuideArray.append(obj)
                            
                            self.guideautoid = obj.autoid
                            print("please print this time",self.guideautoid)
                          
                            print("subArray = \(self.GuideArray.count)")
                            //self.guidesList.reloadData()
                            
                            
                        }
                    }
                    
                    
                }
            }
        }
    }
    
    
    func finalfetch()->Int{
        let db = Database.database().reference()
        let parent3 = db.child("No of publications").child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")")
        parent3.observe(DataEventType.value) { (snapshot) in
            // print("snap = \(snapshot)")
            print("previouss",snapshot.value)
            let event = snapshot.value as? [String:Any]
            for (key,val) in event!
            {
                if key == "noofpublications"
                {
                    print("the value as = \(val as? Int)")
                }
            }
            let temp = snapshot.value
                          self.prevvalue = temp as! Int

        
    }
        return prevvalue
    }
    
    
    func finalfetchtest(callback: @escaping ResponseHandlerBlock)
    {
        let db = Database.database().reference()
        let parent3 = db.child("No of publications").child("\(appdelegate.year ?? "")").child("\(appdelegate.dept ?? "")")
        parent3.observe(DataEventType.value) { (snapshot) in
            // print("snap = \(snapshot)")
            if snapshot.exists()
            {
                print("previouss",snapshot.value)
                let event = snapshot.value as? [String:Any]
                for (key,val) in event!
                {
                    if key == "noofpublications"
                    {
                        let temp = val as? Int
                        callback(temp as AnyObject, nil)
                    }
                }
            }
            else
            {
                callback(0 as AnyObject, nil)
            }
            
            
            
            
        }
        
    }
    
    
    func fetchNoofPubs(){
        let db = Database.database().reference()
        let ref = db.child("No of publications").child("\(appdelegate.year ?? "")")
        
        ref.observe(DataEventType.value) { (snapshot) in
            // print("snap = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            //print("event = \(event)")
            for (key,value) in event!
            {
                let ref = db.child("No of publications").child("\(appdelegate.year ?? "")").child(key)
                
                ref.observe(DataEventType.value) { (snapshot) in
                    print("snap1 = \(snapshot)")
                    let event = snapshot.value as? [String:Any]
                    print(snapshot.value)
                    let obj = Admindatamodel().fetchPublications(data: (event! as [String:Any]))
                    self.publndata.append(obj)
                    if obj.deptpub == "cse"{
                        self.tempno = obj.noofpublications!
                       // let tempid = obj.uniqueid
                        db.child("No of publications").child("\(appdelegate.year ?? "")").child(obj.uniqueid!).removeValue()
                    
                    }
                    
                    
                }
//                let temp = snapshot.value
//                self.prevvalue = temp as! Int
            }
            appdelegate.unique = ref.childByAutoId().key
            let ref2  = ref.childByAutoId()
            
            let data =   ["dept":"\(appdelegate.dept ?? "")","noofpublications":Int(self.schpub.text!)!+self.tempno,"uniqueid":appdelegate.unique!] as [String:Any]
            ref2.setValue(data)
            
            
            

          //  return prevvalue
        }
    
    }
    
  
    
    
    @IBAction func Submit(_ sender: Any) {
        // let obj = self.registerwithlocaluid()
        //  print("due to button")
        //  print("\(String(describing: obj.Guidename))")
        
        if self.scholarimage.image != nil
        {
            //            self.activitystart()
            if let uploadData = self.scholarimage.image!.pngData()
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
                                        self.customAlert(title: "Error While Deleting User", message: error.localizedDescription, buttonTitle: "OK")
                                    } else {
                                        
                                        self.customAlert(title: "Success", message: "User Deleted Create New User", buttonTitle: "OK")
                                        // Account deleted.
                                    }
                                })
                                
                            })
                            alert.addAction(ok)
                            
                            
                            
                            //                            self.activitystop()
                            return
                        }
                        else
                        {
                            storageRef.downloadURL(completion: { (url, error) in
                                print("image URL: \((url?.absoluteString)!)")
                                if let profileImageUrl = url?.absoluteString
                                {
                                    let values = ["profileurl": profileImageUrl]
                                    self.registerImg(values: values as [String : AnyObject])
                                }
                            })
                        }
                        
                        
                        
                        
                    })
                }
                
            }
        }
        
        
        // print(a as Any)
        self.auth.createUser(withEmail: self.schemail.text!, password: self.password.text!) { (user, error) in
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
        print("validatedint in submit = \(self.validatedint)")
        
         //self.fetchNoofPubs()
        //self.performSegue(withIdentifier: "1to6", sender: self)
        
    }
    
    var validatedint:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.fetchGuides(year: appdelegate.year!, dept: appdelegate.dept!)
        self.finalfetchtest { (data, error) in
            self.validatedint = data as? Int
            if self.validatedint != 0
            {
                 print("validatedint = \(self.validatedint)")
            }
            else
            {
                print("data is not avail")
            }
           
            
        }
        
        
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
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

