//
//  ViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 28/02/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
let AuthObj = Auth.auth()
class ViewController: UIViewController {
//let backgroundImageView = UIImageView()
    @IBOutlet weak var appInfo: UILabel!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailID: UITextField!
    var vcrole:Int?
    var uuID:String?
    
    var alluserdetails:[UserdetilsDataModel] = []

    
    
    //
    
    
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    func startactivity()
    {
        self.activity.isHidden = false
        self.activity.center = view.center
        self.activity.startAnimating()
    }
    
    func stopactivity()
    {
        self.activity.stopAnimating()
        self.activity.isHidden = false
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.activity.isHidden = true
        self.password.isSecureTextEntry = true
    }
    
    @IBAction func login(_ sender: Any) {
        print("uname = \(emailID.text!)")
        print("password = \(password.text!)")
        
        
        
        if self.emailID.text == "" && self.password.text == ""
        {
            self.callAlert(msg: "Provide Email Address And Password")
        }
        else if self.emailID.text == ""
        {
            self.callAlert(msg: "Provide Email ")
        }
        else if self.password.text == ""
        {
            self.callAlert(msg: "Provide Password ")
        }
        else
        {
            self.startactivity()
            self.login1()
            
        }
    }
    func callAlert(msg:String)
    {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
    }
    func login1()
    {
        
        
        
        
        AuthObj.signIn(withEmail: self.emailID.text!, password: self.password.text!, completion:{(user,error) in
            
            if(error != nil)
            {
                let alertcontrollerc = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                self.present(alertcontrollerc, animated: true, completion: nil)
                
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (ok) in
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let dest = storyboard.instantiateViewController(withIdentifier :"adminlogin") as! ViewController
                    
                    let appdelegate = UIApplication.shared.delegate as! AppDelegate
                    let nav = UINavigationController(rootViewController: dest)
                    appdelegate.window?.rootViewController = nav
                })
                
                alertcontrollerc.addAction(ok)
                
            }
            else if user?.user.uid == "W0T1h3wUiKXP1dHKQalULBvTV6T2"{
                self.stopactivity()
                let storyboard = UIStoryboard(name: "Principal", bundle: nil)
                let dest = storyboard.instantiateViewController(withIdentifier :"principallogin") as! BarChartsYearViewController
                
                
                let appdelegate = UIApplication.shared.delegate as! AppDelegate
                let nav = UINavigationController(rootViewController: dest)
                appdelegate.window?.rootViewController = nav
            }
            else
            {
                print("user?.email = \(String(describing: user?.user.uid))")
                print("user?.uid = \(String(describing: user?.user.uid))")
                 appdelegate.uid = user?.user.uid
                if user?.user.uid != "QH3R4r5hPOddBPHSHHgRnPfkIdf1"
                {
                    AdminViewModel().getuserDetails(setuserid: (user?.user.uid)!, callBack: {  (cdeptdata, error) in
                        self.alluserdetails = cdeptdata as! [UserdetilsDataModel]
                        
                        if(self.alluserdetails.count > 0)
                        {
                            for i in self.alluserdetails
                            {
                                
                                if i.rolename != nil
                                {
                                    print("the i.role is = \(i.rolename!)")
                                    scholerdep = i.department
                                    //defaults.set(i.role, forKey: "role")
                                    self.vcrole = i.rolename
                                    self.loadinglogin()
                                    
                                    
                                }
                                
                                
                            }
                            
                            
                            
                        }
                    })
                }
             
                else
                {
                    //                    defaults.set(0, forKey: "role")
                    //                    defaults.set(user?.user.uid, forKey: "UserID")
                    //                    defaults.set(user?.user.email!, forKey: "Email")
                    self.vcrole = 0
                    self.loadinglogin()
                    
                }
                
                
            }
            
        })
        
        
    }
    
    func loadinglogin()
    {
        //  self.vcrole = defaults.object(forKey: "role") as? Int
        //  self.uuID = defaults.object(forKey: "UserID") as? String
        self.checkrole()
    }
    func checkrole()
    {
        print("the vc role is = \(self.vcrole)")
        switch self.vcrole
        {
        case 0?:
            print("the admin login")
            self.stopactivity()
            //            self.loadimg.isHidden = true
            let storyboard = UIStoryboard(name: "AdminStoryboard", bundle: nil)
            let dest = storyboard.instantiateViewController(withIdentifier :"adminlogin") as! selectViewController
            
            
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let nav = UINavigationController(rootViewController: dest)
            appdelegate.window?.rootViewController = nav
        case 1?:
            print("the Guide login")
            self.stopactivity()
            //            self.loadimg.isHidden = true
            let storyboard = UIStoryboard(name: "GuideStoryBoard", bundle: nil)
            let dest = storyboard.instantiateViewController(withIdentifier :"guidelogin") as! guideLoginViewController
            
            
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let nav = UINavigationController(rootViewController: dest)
            appdelegate.window?.rootViewController = nav
        case 2?:
            print("the scholar login")
            self.stopactivity()
            //            self.loadimg.isHidden = true
            let storyboard = UIStoryboard(name: "scholarStoryboard", bundle: nil)
            let dest = storyboard.instantiateViewController(withIdentifier :"scholarlogin") as! ScholarLoginViewController
            
            
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let nav = UINavigationController(rootViewController: dest)
            appdelegate.window?.rootViewController = nav
            
        default :
            break
        }
        
        
    }
  
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animateLabel()
    }
    func animateLabel(){
        appInfo.text = ""
        let appInfor = "Welcome to Headway, a Research and Development progress app."
        for char in appInfor{
            appInfo.text! += "\(char)"
            RunLoop.current.run(until: Date()+0.25)
        }
    }
    
    }
   
//    @IBAction func signin(_ sender: Any) {
//        Auth.auth().signIn(withEmail: emailID.text!, password: password.text!) { (user, error) in
//            if error == nil{
//             self.performSegue(withIdentifier: "sign", sender: self)
//
////                let storyboard = UIStoryboard(name: "AdminStoryboard", bundle: nil)
////                let controller = storyboard.instantiateViewController(withIdentifier: "admin")
////                self.present(controller, animated: false, completion: nil)
////
//            }
//            else{
//                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//                alertController.addAction(defaultAction)
//                self.present(alertController, animated: true, completion: nil)
//            }
//        }
//
//
//
//    }
//    }

    
//
//  ViewController.swift
//  smartschoolbus1
//
//  Created by IOSLevel-01 on 05/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

//
//  ViewController.swift
//  smartschoolbus1
//
//  Created by IOSLevel-01 on 05/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

//import UIKit
//import Firebase
//import FirebaseAuth
//
//let AuthObj = Auth.auth()
//
//class ViewController: UIViewController {
//    
//    @IBOutlet weak var uname: UITextField!
//    @IBOutlet weak var password: UITextField!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//    
//    //user All Attributes
//    var vcrole:Int?
//    var subdeptartment:String?
//    var department:String?
//    var firstName:String?
//    var imgUrl:String?
//    var api:Int?
//    var quality:Int?
//    var lastName:String?
//    var imageUrl:String?
//    var email:String?
//    var uuID:String?
//    
//    var alluserdetails:[AllUserDetails] = []
//    
//    
//    @IBAction func login(_ sender: UIButton)
//    {
//        print("uname = \(uname.text!)")
//        print("password = \(password.text!)")
//        
//        if self.uname.text == "" && self.password.text == ""
//        {
//            self.callAlert(msg: "Provide Email Address And Password")
//        }
//        else if self.uname.text == ""
//        {
//            self.callAlert(msg: "Provide Email ")
//        }
//        else if self.password.text == ""
//        {
//            self.callAlert(msg: "Provide Password ")
//        }
//        else
//        {
//            
//            self.login1()
//            
//        }
//        
//    }
//    
//    
//    
//    func login1()
//    {
//        
//        
//        
//        
//        AuthObj.signIn(withEmail: self.uname.text!, password: self.password.text!, completion:{(user,error) in
//            
//            if(error != nil)
//            {
//                let alertcontrollerc = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//                self.present(alertcontrollerc, animated: true, completion: nil)
//                
//                let ok = UIAlertAction(title: "OK", style: .default, handler: { (ok) in
//                    
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                    let dest = storyboard.instantiateViewController(withIdentifier :"Homeview") as! ViewController
//                    
//                    let appdelegate = UIApplication.shared.delegate as! AppDelegate
//                    let nav = UINavigationController(rootViewController: dest)
//                    appdelegate.window?.rootViewController = nav
//                })
//                
//                alertcontrollerc.addAction(ok)
//                
//            }
//            else
//            {
//                print("user?.email = \(String(describing: user?.user.uid))")
//                print("user?.uid = \(String(describing: user?.user.uid))")
//                if user?.user.uid != "EVRJby81FScF5bPJ9Hv8XktIpJ63"
//                {
//                    AdminViewModel().getuserDetails(setuserid: (user?.user.uid)!, callBack: {  (cdeptdata, error) in
//                        self.alluserdetails = cdeptdata as! [AllUserDetails]
//                        
//                        if(self.alluserdetails.count > 0)
//                        {
//                            for i in self.alluserdetails
//                            {
//                                //                                    if i.role != nil && i.subdepartment != nil && i.department != nil && i.firstName != nil && i.profileImageUrl != nil && i.lastName != nil && user?.user.uid != nil
//                                //                                    {
//                                //                                        defaults.set(i.role, forKey: "role")
//                                //                                        defaults.set(i.subdepartment!, forKey: "subdept")
//                                //                                        defaults.set(i.department!, forKey: "dept")
//                                //                                        defaults.set(i.firstName!, forKey: "firstname")
//                                //
//                                //                                        defaults.set(i.profileImageUrl!, forKey: "ProfileImageUrl")
//                                //                                        defaults.set(i.email!, forKey: "Email")
//                                //                                        defaults.set(user?.user.uid, forKey: "UserID")
//                                //                                        defaults.set(i.lastName!, forKey: "lastName")
//                                //
//                                
//                                
//                                if i.role != nil
//                                {
//                                    defaults.set(i.role, forKey: "role")
//                                    self.loadinglogin()
//                                    
//                                    
//                                }
//                                
//                                
//                            }
//                            
//                            
//                            
//                        }
//                    })
//                }
//                else
//                {
//                    defaults.set(0, forKey: "role")
//                    defaults.set(user?.user.uid, forKey: "UserID")
//                    defaults.set(user?.user.email!, forKey: "Email")
//                    self.loadinglogin()
//                    
//                }
//                
//                
//            }
//            
//        })
//        
//        
//    }
//    
//    func loadinglogin()
//    {
//        self.vcrole = defaults.object(forKey: "role") as? Int
//        self.uuID = defaults.object(forKey: "UserID") as? String
//        self.checkrole()
//    }
//    
//    
//    
//    func checkrole()
//    {
//        
//        switch self.vcrole
//        {
//        case 0?:
//            print("the admin login")
//            //            self.loadimg.isHidden = true
//            let storyboard = UIStoryboard(name: "Admin", bundle: nil)
//            let dest = storyboard.instantiateViewController(withIdentifier :"admindash") as! AdminTabbarViewController
//            
//            
//            let appdelegate = UIApplication.shared.delegate as! AppDelegate
//            let nav = UINavigationController(rootViewController: dest)
//            appdelegate.window?.rootViewController = nav
//            
//        case 2?:
//            
//            let storyboard = UIStoryboard(name: "Driver", bundle: nil)
//            let dest = storyboard.instantiateViewController(withIdentifier :"drivertab") as! DriverTabViewController
//            
//            
//            let appdelegate = UIApplication.shared.delegate as! AppDelegate
//            let nav = UINavigationController(rootViewController: dest)
//            appdelegate.window?.rootViewController = nav
//            
//            
//        case 1?:
//            print("the parent log in")
//            //            self.loading.isHidden = true
//            //            let storyboard = UIStoryboard(name: "Faculty 2", bundle: nil)
//            //            let dest = storyboard.instantiateViewController(withIdentifier :"fdash") as! First_Dash_BoardViewController
//            //                    let appdelegate = UIApplication.shared.delegate as! AppDelegate
//            //            appdelegate.facuseruid = self.uuID!
//            //            appdelegate.facname = self.firstName!
//            //            appdelegate.facdepartment = self.department!
//            //            appdelegate.facsubdepartment = self.subdeptartment!
//            //            if appdelegate.facsubdepartment == "nope"
//            //            {
//            //                appdelegate.facsubdepartment = "1"
//            //            }
//            //
//            //        let nav = UINavigationController(rootViewController: dest)
//            //                    appdelegate.window?.rootViewController = nav
//            
//        case 3?:
//            print("the coordinator is logged in")
//            //            self.loadimg.isHidden = true
//            //            let storyboard = UIStoryboard(name: "SubCo-ordinators", bundle: nil)
//            //            let dest = storyboard.instantiateViewController(withIdentifier :"subcoordiantor") as! SubCo_DashBoardViewController
//            //            let appdelegate = UIApplication.shared.delegate as! AppDelegate
//            //
//            //            let nav = UINavigationController(rootViewController: dest)
//            //            appdelegate.window?.rootViewController = nav
//            
//            
//        case 4?:
//            print("4")
//            //            self.loadimg.isHidden = true
//            //            let storyboard = UIStoryboard(name: "SubCo-ordinators", bundle: nil)
//            //            let dest = storyboard.instantiateViewController(withIdentifier :"subcoordiantor") as! SubCo_DashBoardViewController
//            //            let appdelegate = UIApplication.shared.delegate as! AppDelegate
//            //
//            //            let nav = UINavigationController(rootViewController: dest)
//            //            appdelegate.window?.rootViewController = nav
//            
//            
//            
//        case 5?:
//            print("the Mentors is logged in")
//            //            self.loadimg.isHidden = true
//            //            let storyboard = UIStoryboard(name: "Mentors", bundle: nil)
//            //            let dest = storyboard.instantiateViewController(withIdentifier :"mentorsstoryboard") as! MentorsDashBoardViewController
//            //            let appdelegate = UIApplication.shared.delegate as! AppDelegate
//            //
//            //            let nav = UINavigationController(rootViewController: dest)
//            //            appdelegate.window?.rootViewController = nav
//            
//            
//            
//        default :
//            break
//        }
//    }
//    
//    
//    
//    func callAlert(msg:String)
//    {
//        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
//        self.present(alert, animated: true, completion: nil)
//        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(ok)
//    }
//    
//}
//
//struct AllUserDetails
//{
//    var firstName:String?
//    var rfid:String?
//    var cls:String?
//    var parentname:String?
//    var driverid:String?
//    var parentph:String?
//    var addr:String?
//    var role:Int?
//    var busno:String?
//    var stop:String?
//    var uname:String?
//    var pwd:String?
//    var userid:String?
//    
//    
//    
//    
//    
//    
//    init() {
//        
//        
//        
//    }
//    //this one just created not implemented
//    
//    
//    init(withuserid uid:String)
//    {
//        self.userid = uid
//    }
//    
//    init(withDictionary dict:[String:AnyObject])
//    {
//        
//        
//        self.firstName = dict["firstName"] as? String ?? ""
//        self.rfid = dict["rfid"] as? String
//        self.cls = dict["cls"] as? String
//        
//        self.parentname = dict["parentname"] as? String ?? ""
//        self.parentph = dict["parentph"] as? String ?? ""
//        self.addr = dict["addr"] as? String ?? ""
//        self.busno = dict["busno"] as? String ?? ""
//        
//        
//        self.role = dict["role"] as? Int ?? 0
//        self.uname = dict["uname"] as? String ?? ""
//        self.stop = dict["stop"] as? String ?? ""
//        self.pwd = dict["pwd"] as? String ?? ""
//        self.driverid = dict["driverid"] as? String ?? ""
//        
//        
//        
//    }
//}
