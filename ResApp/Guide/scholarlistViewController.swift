//
//  scholarlistViewController.swift
//  ResApp
//
//  Created by IOSLevel01 on 08/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class scholarlistViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ScholarArray.count
    }
    var schname: String?
    var scholaruid:String?
    
    @IBOutlet weak var scholarlist: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! scholardisplayTableViewCell
        //  print("GuideArray[indexPath.row].Guidename = \(GuideArray[indexPath.row].uid)")
        cell.scholarname.text = ScholarArray[indexPath.row].scholarname
        cell.schuid.text = ScholarArray[indexPath.row].scholaruid
       // print( "scholars",ScholarArray[indexPath.row].scholarname as Any)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let index = tableView.indexPathForSelectedRow
        let cell = tableView.cellForRow(at: index!) as! scholardisplayTableViewCell
        self.schname = cell.scholarname.text
        self.scholaruid = cell.schuid.text
        
        
        
    self.performSegue(withIdentifier: "schview", sender: scholarlist)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "schview" {
           
                let controller = segue.destination as! scholarprofileviewViewController
            controller.schname = self.schname
            controller.scholaruid = self.scholaruid
            
        
        
    }
    }
    
    var ScholarArray:[GuideDataModel] = []
    
   
    @IBOutlet weak var scholarsList: UITableView!
    
    @IBOutlet weak var scholarname: UILabel!
    @IBOutlet weak var scholarimage: UIView!
    override func viewDidLoad(){
        super.viewDidLoad()
        self.fetchMyScholars(year: appdelegate.year!, dept: appdelegate.dept!,userid: appdelegate.uid!)
        

        // Do any additional setup after loading the view.
    }
    
    
    func fetchMyScholars(year: String, dept: String,userid: String){
       
            let db = Database.database().reference()
            let ref = db.child("FetchUserdetails").child("Guide").child(year).child(dept).child(userid)
            
            // print("year = \(appdelegate.year)")
            //print("dept = \(appdelegate.dept)")
            //observing the data changes
            ref.observe(DataEventType.value) { (snapshot) in
                 print("snap1 = \(snapshot)")
                let event = snapshot.value as? [String:Any]
                //print("event = \(event)")
                for (key,value) in event!
                {
                    let ref = db.child("FetchUserdetails").child("Guide").child(year).child(dept).child(userid).child(key).child("scholars")
                    
                    
                    ref.observe(DataEventType.value) { (snap) in
                        print("snap2 = \(snap)")
                        let event1 = snap.value as? [String:Any]
                        //print("event2 = \(event)")
                        

                        for (key1,value1) in event1!
                        {
                            let ref = db.child("FetchUserdetails").child("Guide").child(year).child(dept).child(userid).child(key).child("scholars").child(key1)
                                //   print("event1 = \(event)")
                            ref.observe(DataEventType.value) { (snap1) in
                                print("snap = \(snap1)")
                                let event2 = snap1.value as? [String:Any]
                                //print("event2 = \(event)")
                        
                                   let obj = GuideDataModel().fetchScholars(data: (event2 as! [String:Any]))
                                self.ScholarArray.append(obj)
                                print("subArray = \(self.ScholarArray.count)")
                                self.scholarlist.reloadData()
                                
                                }
                            }
                        }
                        
                        
                    }
                }



    
  
    
    
//        let db = Database.database().reference()
//        let ref = db.child("FetchUserdetails").child(year).child(dept)
//
//        // print("year = \(appdelegate.year)")
//        //print("dept = \(appdelegate.dept)")
//        //observing the data changes
//        ref.observe(DataEventType.value) { (snapshot) in
//            // print("snap = \(snapshot)")
//            let event = snapshot.value as? [String:Any]
//            //print("event = \(event)")
//            for (key,value) in event!
//            {
//                let ref = db.child("FetchUserdetails").child(year).child(dept).child(key)
//                print("key:",key)
//
//                ref.observe(DataEventType.value) { (snap) in
//                    // print("snap2 = \(snap)")
//                    let event = snap.value as? [String:Any]
//                    //print("event2 = \(event)")
//                    for (key1,value1) in event!
//                    {
//                        let ref =
//                            db.child("FetchUserdetails").child(year).child(dept).child(key).child(key1)
//
//                        print("key1:",key1)
//                        ref.observe(DataEventType.value) { (snap) in
//                            print("snap1 = \(snap)")
//                            let event = snap.value as? [String:Any]
//                            //   print("event1 = \(event)")
//                            let obj = Admindatamodel().basicguidedate(data: (event as! [String:Any]))
//
//                            self.GuideArray.append(obj)
//                            print("subArray = \(self.GuideArray.count)")
//                            self.guideTable.reloadData()
//
//
//                        }
//                    }
//
//
//                }
//            }
//
//    }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}

