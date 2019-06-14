//
//  GuidePopUpViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 01/05/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase

protocol guideproto
{
    func selectingGuide(Seelcted:String)
}

class GuidePopUpViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GuideArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "guidePopup", for: indexPath) as! GuidesTableViewCell
      //  print("GuideArray[indexPath.row].Guidename = \(GuideArray[indexPath.row].uid)")
        cell.name.text = GuideArray[indexPath.row].Guidename
        cell.uid.text = GuideArray[indexPath.row].uid
        appdelegate.uid = cell.uid.text
        appdelegate.guidename = cell.name.text
        print("appdelegate.uid===\(appdelegate.uid)")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = tableView.indexPathForSelectedRow
        let cell = tableView.cellForRow(at: index!) as! GuidesTableViewCell
     //   print("cell.uid.text = \(cell.uid.text)")
      //  self.fetchGuide(userid: cell.uid.text!)
        self.fetchdetailsofguide(userid: cell.uid.text!)
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    

    
    var delegate:guideproto?
    @IBOutlet weak var guideTable: UITableView!
    var GuideArray:[Admindatamodel] = []
    
    
    
    func fetchdetailsofguide(userid:String)
    {
        let db = Database.database().reference()
        let ref = db.child(appdelegate.year!).child(appdelegate.dept!).child(userid)
        ref.observe(DataEventType.value) { (snap) in
        
            let dataevent = snap.value as? [String:Any]
            for (key,_) in dataevent!
            {
                let ref = db.child(appdelegate.year!).child(appdelegate.dept!).child(userid).child(key)
                ref.observe(DataEventType.value) { (snap) in
                    print("the snap for guide choosed= \(snap)")
                    let dataevent = snap.value as? [String:Any]
                 //   let obj = Admindatamodel().basicguidedate(data: (dataevent as! [String:Any]))
                    
                }
            }
        }
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
                print("key:",key)
                
                ref.observe(DataEventType.value) { (snap) in
                   // print("snap2 = \(snap)")
                    let event = snap.value as? [String:Any]
                    //print("event2 = \(event)")
                    for (key1,value1) in event!
                    {
                        let ref =
                    db.child("FetchUserdetails").child("Guide").child(year).child(dept).child(key).child(key1)
                        
                        print("key1:",key1)
                        ref.observe(DataEventType.value) { (snap) in
                            print("snap1 = \(snap)")
                            let event = snap.value as? [String:Any]
                         //   print("event1 = \(event)")
                            let obj = Admindatamodel().basicguidedate(data: (event as! [String:Any]))
                            
                            self.GuideArray.append(obj)
                            print("subArray = \(self.GuideArray.count)")
                            self.guideTable.reloadData()
                            
                            
                        }
                    }
                    
                    
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       // self.fetchGuide()
        self.fetchGuides(year: appdelegate.year!, dept: appdelegate.dept!)
        

        // Do any additional setup after loading the view.
    }
    

 

}


