//
//  EducationViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 29/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase
class EducationViewController: UIViewController , UIPopoverPresentationControllerDelegate{

    @IBOutlet weak var guideName: UITextField!
    @IBOutlet weak var university: UITextField!
    @IBOutlet weak var yop: UITextField!
    @IBOutlet weak var specialisation: UITextField!
    @IBOutlet weak var branch: UITextField!
    @IBOutlet weak var degree: UITextField!
    @IBOutlet weak var slno: UITextField!
    
    
    @IBOutlet weak var selectGuide: UIButton!
    
    @IBAction func sekectingGuide(_ sender: UIButton) {
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
    
    
    let db = Database.database().reference()
    @IBAction func save(_ sender: Any) {
       
        
        let parent = db.child("Academic details").child("Education details").child("\(appdelegate.uid ?? "")").childByAutoId()
     let data = ["slno1": self.slno.text, "degree":self.degree.text ,"branch": self.branch.text, "specialisation": self.specialisation.text,"year of passing": self.yop.text, "university": self.university.text] as [String:Any]
       parent.setValue(data)
        
    }
    
    @IBAction func service(_ sender: Any) {
       // self.registerwithlocaluid()
//        self.performSegue(withIdentifier: "toserv", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func registerwithlocaluid(uid:String)
    {
        var objdata = education()
        
        objdata.Degree = self.degree.text!
        objdata.Slno = self.slno.text!
        objdata.Branch = self.branch.text!
        objdata.Specialisation = self.specialisation.text!
        objdata.YOP = self.yop.text!
        objdata.University = self.university.text!
        print("degree = \(objdata.Degree!)")
        print("slno = \(objdata.Slno!)")
        print("branch = \(objdata.Branch!)")
        print("specialisation = \(objdata.Specialisation!)")
        print("YOP = \(objdata.YOP!)")
        print("University = \(objdata.University!)")
       // somearray.append(objdata)
        self.clearvalues()
        
        //DONT DELETE.......temporary storage in appdelegate to store 6 vc data....not advised
//        appdelegate.edn.Slno = self.slno.text!
//        appdelegate.edn.Degree = self.degree.text!
//        appdelegate.edn.Branch = self.branch.text!
//        appdelegate.edn.Specialisation = self.specialisation.text!
//        appdelegate.edn.YOP = self.yop.text!
//        appdelegate.edn.University = self.university.text!
//        appdelegate.Edn.all.append(appdelegate.edn)
//        self.clearvalues()
//
    }
    func clearvalues(){
        self.slno.text = ""
        self.degree.text = ""
        self.branch.text = ""
        self.specialisation.text = ""
        self.yop.text = ""
        self.university.text = ""
    }
    

   
struct education {
    var Slno:String?
    var Degree:String?
    var Branch:String?
    var Specialisation:String?
    var YOP:String?
    var University:String?
    //
    init()
    {
        //
    }
    //
    init(withdict dict:[String:AnyObject])
    {
        Slno = dict["Slno"] as? String ?? ""
        Degree = dict["Degree"] as? String ?? ""
        Branch = dict["Branch"] as? String ?? ""
        Specialisation = dict["Specialisation"] as? String ?? ""
        YOP = dict["YOP"] as? String ?? ""
        University = dict["University"] as? String ?? ""
        
    }
}
}

