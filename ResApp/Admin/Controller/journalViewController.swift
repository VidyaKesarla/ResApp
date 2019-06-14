//
//  journalViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 29/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase

class journalViewController: UIViewController {
   
//    var Slno4:String?
//    var Coauthorname4:String?
//    var Papertitle4:String?
//    var Journalname:String?
//    var Publisher4:String?
//    var Citation4:String?
//
//
//    //conferences details
//
//    var Slno5:String?
//    var Coauthorname5:String?
//    var Papertitle5:String?
//    var Confname:String?
//    var Publisher5:String?
//    var Citation5:String?
    let db = Database.database().reference()
    @IBAction func save(_ sender: Any) {
        let parent = db.child("Academic details").child("Journal details").child("\(appdelegate.uid ?? "")").childByAutoId()
        let data = ["Slno4": self.slno.text, "Coauthorname4":self.coauthor.text,"Papertitle4":self.titleofpaper.text,"Journalname":self.journalname.text,"Publisher4":self.publisher.text,"Citation4":self.citation.text] as [String:Any]
        parent.setValue(data)

        
        self.registerwithid()
    }
    @IBAction func toconf(_ sender: Any) {
    }
    @IBOutlet weak var citation: UITextField!
    @IBOutlet weak var publisher: UITextField!
    @IBOutlet weak var journalname: UITextField!
    @IBOutlet weak var titleofpaper: UITextField!
    @IBOutlet weak var coauthor: UITextField!
    @IBOutlet weak var slno: UITextField!
    
    func registerwithid(){
        let objdata = Admindatamodel()
        objdata.Slno4 = self.slno.text!
        objdata.Coauthorname4 = self.coauthor.text!
        objdata.Papertitle4 = self.titleofpaper.text!
        objdata.Journalname = self.journalname.text!
        objdata.Publisher4 = self.publisher.text!
        objdata.Citation4 = self.citation.text!
        somearray.append(objdata)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
