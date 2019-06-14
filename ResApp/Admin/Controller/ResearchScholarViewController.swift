//
//  ResearchScholarViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 08/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ResearchScholarViewController: UIViewController,UITabBarDelegate,UITableViewDataSource {
    
    var ScholarArray:[Admindatamodel] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var tablecount:Int?
        if(self.ScholarArray.count > 0){
            tablecount = self.ScholarArray.count
        } else {
            
            tablecount = 0
            
        }
        return tablecount!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! ResearchScholarTableViewCell
        cell.schname.text = ScholarArray[indexPath.row].scholarname
        print("names",ScholarArray[indexPath.row].scholarname)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }

    
    @IBAction func addScholar(_ sender: UIButton) {
       // self.performSegue(withIdentifier: "addSch", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//self.fetchScholars(year: appdelegate.year!, dept: appdelegate.dept!)
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var scholarList: UITableView!
    
    func fetchScholars(year: String, dept: String)
    {
        let db = Database.database().reference()
        let ref = db.child("FetchUserdetails").child("Scholars").child(year).child(dept)
        
        // print("year = \(appdelegate.year)")
        //print("dept = \(appdelegate.dept)")
        //observing the data changes
        ref.observe(DataEventType.value) { (snapshot) in
            // print("snap = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            //print("event = \(event)")
            for (key,value) in event!
            {
                let ref = db.child("FetchUserdetails").child("Scholars").child(year).child(dept).child(key)
                
                
                ref.observe(DataEventType.value) { (snap1) in
                    // print("snap2 = \(snap)")
                    let event1 = snap1.value as? [String:Any]
                    //print("event2 = \(event)")
                    for (key1,value1) in event1!
                    {
                        let ref =
                            db.child("FetchUserdetails").child("Scholars").child(year).child(dept).child(key).child(key1)
                        
                        
                        ref.observe(DataEventType.value) { (snap2) in
                            print("snap1 = \(snap2)")
                            let event2 = snap2.value as? [String:Any]
                            //   print("event1 = \(event)")
                            let obj = Admindatamodel().basicscholardata(data: (event2 as! [String:Any]))
                            
                            self.ScholarArray.append(obj)
                            print("subArray = \(self.ScholarArray.count)")
                          
                            self.scholarList.reloadData()
                            
                            
                        }
                    }
                    
                    
                }
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

}
