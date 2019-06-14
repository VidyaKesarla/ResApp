//
//  scholarprofileviewViewController.swift
//  ResApp
//
//  Created by IOSLevel01 on 08/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase

class scholarprofileviewViewController: UIViewController {
let db = Database.database().reference()
    var schname:String?
    var scholaruid:String?
    var autoid1:String?
    var autoid2:String?
    var autoid3:String?
    var autoid4:String?
    var autoid5:String?
    var autoid6:String?
    var autoid7:String?
    var autoid8:String?
    var autoid9:String?
    var autoid10:String?
    
    
    
    @IBOutlet weak var level1: UILabel!
    //var autoid1:String?
    
  
    @IBAction func existing(_ sender: Any) {
        self.fetchSliderValue()
        
    }
    @IBAction func newuser(_ sender: Any) {
        let ref = db.child("scholarprogress").child(appdelegate.year!).child(appdelegate.dept!).child(appdelegate.uid!).child(scholaruid!)
        //   let auto = ref.childByAutoId().key
        let curval = (prevslider + self.sliderlevel.value)
        let data = ["sliderdata":curval] as [String:Any]
        
        ref.updateChildValues(data)
        
    }
    @IBOutlet weak var scholarname: UILabel!
    @IBAction func upgrade1(_ sender: Any){
        let ref = db.child("scholarprogress").child(appdelegate.year!).child(appdelegate.dept!).child(appdelegate.uid!).child(scholaruid!)
        let curval = (prevslider + self.sliderlevel.value)
        let data = ["sliderdata":curval] as [String:Any]
        ref.updateChildValues(data)
        self.progressbar1.value = 0
    }
    @IBAction func upgrade2(_ sender: Any) {
    }
    
   
    @IBOutlet weak var percentage: UILabel!
    var prevslider:Float = 0
    @IBOutlet weak var sliderlevel: UISlider!
    @IBOutlet weak var progressbar2: UISlider!
    @IBOutlet weak var project2: UILabel!
    @IBOutlet weak var progressbar1: UISlider!
    @IBOutlet weak var project1: UILabel!
    @IBOutlet weak var scholarimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scholarname.text = self.schname
        
       
          //  print("fetching previous value")
 
    
        
    }
    @IBAction func slideraction(_ sender: UISlider)
    {
//        if Int(prevslider) > 0{
//            sender.value = prevslider + sender.value
//            print("prev value",sender.value)
//        }
         self.percentage.text = String(self.progressbar1.value)
        let val = Int(sender.value)
        print("the slider val = \(val)")
        if sender.value < 10
        {
            self.sliderlevel.value = Float(val) + prevslider
            print("slider5",self.sliderlevel.value)
           self.sliderlevel.tintColor = UIColor.red
        }
        if sender.value == 10
        {
            self.sliderlevel.value = Float(val) + prevslider
            print("slider10",self.sliderlevel.value)
            self.sliderlevel.tintColor = UIColor.green
        }
        
       // appdelegate.slidervalue = self.sliderlevel.value
    }
    
    
    
    
    
    func fetchSliderValue(){
        
        let db = Database.database().reference()
        let ref = db.child("scholarprogress").child(appdelegate.year!).child(appdelegate.dept!).child(appdelegate.uid!).child(scholaruid!).child("sliderdata")
        ref.observe(DataEventType.value) { (snapshot) in
            print("snap1 = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            //print("event = \(event)")
//            for (key,value) in event!
//            {
//                let ref = db.child("scholarprogress").child(appdelegate.year!).child(appdelegate.dept!).child(appdelegate.uid!).child(self.scholaruid!).child(key)
//                print("key in slider fetch",key)
//                ref.observe(DataEventType.value) { (snap1) in
//                    print("snap = \(snap1)")
//                    let event2 = snap1.value as? [String:Any]
//                    //print("event2 = \(event)")
//                    print("snap1111",snap1)
//                    for (key1,value1) in event2!
//                    {
//                        let ref = db.child("scholarprogress").child(appdelegate.year!).child(appdelegate.dept!).child(appdelegate.uid!).child(self.scholaruid!).child(key).child("sliderdata")
//                        print("key in slider fetch",key1)
//                        ref.observe(DataEventType.value) { (snap2) in
//                            print("snap = \(snap2)")
//                            let event3 = snap2.value as? [String:Any]
                    
                   // let obj = GuideDataModel().fetchSlider(slider: (event as! [String:Any]!))
            print(snapshot.value)
           // let j = (snapshot.value)
       
           // let j = snapshot.value
            let prevvalue = snapshot.value
            self.prevslider = prevvalue as! Float
                    print("slidervalue",snapshot.value ?? "")
                
                
    }

}

}

