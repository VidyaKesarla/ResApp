//
//  postnotificationViewController.swift
//  ResApp
//
//  Created by IOSLevel01 on 08/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase
class postnotificationViewController: UIViewController,UIPopoverPresentationControllerDelegate,scholarproto
{
    
    func selectingScholar(Selected: String, SelectedUid:String)
    {
        print("the selected = \(Selected)")
        self.selectedscholer.append(Selected)
        self.selectedscholaruid.append(SelectedUid)
        print("self approval array = \(self.selectedscholer)")
        print("scholar uids= \(self.selectedscholaruid)")
    }
    
    
    var selectedscholer:[String] = []
   
    var selectedscholaruid:[String] = []
let db = Database.database().reference()
    @IBAction func post(_ sender: Any) {
       let parent = db.child("Notifications").child("\(appdelegate.dept ?? "")")
        
    }
    
    @IBOutlet weak var notificationtext: UITextView!
    
    @IBAction func selectingScholar(_ sender: UIButton) {
        let popControl = UIStoryboard(name: "GuideStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "scholarpopup") as! ScholarsPopupViewController
        popControl.modalPresentationStyle =   UIModalPresentationStyle.popover
        popControl.notifcationdata = notificationtext.text
        popControl.preferredContentSize.width = self.view.frame.size.width / 3
        popControl.preferredContentSize.height = self.view.frame.size.height / 5
        //popControl.delegate  = self;
        popControl.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popControl.popoverPresentationController?.delegate = self
        popControl.popoverPresentationController?.sourceView = sender as? UIView
        
        
        popControl.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
        
        self.present(popControl, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var postnotification: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        print("the appdelegate final scholer = \(finalselectedscholer))")
    }

}

