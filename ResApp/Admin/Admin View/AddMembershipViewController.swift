//
//  AddMembershipViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 09/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase

class AddMembershipViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var GuideArray:[Admindatamodel] = []
    var GuideArray2:[Admindatamodel] = []
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberofrows = 1
        switch tableView{
        case JournalTableview:
            numberofrows = GuideArray.count
        case ConferenceTableView:
            numberofrows = GuideArray2.count
        default:
            print("1")
        }
        return numberofrows
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //    var Slno5:String?
        //    var Coauthorname5:String?
        //    var Papertitle5:String?
        //    var Confname:String?
        //    var Publisher5:String?
        //    var Citation5:String?
        var cell = UITableViewCell()
        switch tableView{
        case JournalTableview:
            let cell = tableView.dequeueReusableCell(withIdentifier: "journalscell", for: indexPath) as! AddJournalTableViewCell
            cell.slno.text = GuideArray[indexPath.row].Slno4
            cell.coauthorname.text = GuideArray[indexPath.row].Coauthorname4
            cell.papertitle.text = GuideArray[indexPath.row].Papertitle4
            cell.journalname.text = GuideArray[indexPath.row].Journalname
            cell.publisher.text = GuideArray[indexPath.row].Publisher4
            cell.publicationcitation.text = GuideArray[indexPath.row].Citation4
            
            //returnCell = cell
        //return returnCell
        case ConferenceTableView:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "conferencescell", for: indexPath) as! AddConferencesTableViewCell
            //cell.slno.text = GuideArray[indexPath].sln
            cell.slno.text = GuideArray2[indexPath.row].Slno5
            cell.coauthorname.text = GuideArray2[indexPath.row].Coauthorname5
            cell.papertitle.text = GuideArray2[indexPath.row].Papertitle5
            cell.conferencename.text = GuideArray2[indexPath.row].Confname
            cell.publisher.text = GuideArray2[indexPath.row].Publisher5
            cell.citation.text = GuideArray2[indexPath.row].Citation5
            //  returnCell = cell
            //return returnCell
            
            //  return returnCell
            
        default:
            print("hiiii")
        }
        return cell
        
    }
    
    @IBOutlet weak var JournalTableview: UITableView!
    
    @IBOutlet weak var ConferenceTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchGuideJournals(uid: appdelegate.uid!)
        self.fetchGuideConferences(uid: appdelegate.uid!)

        // Do any additional setup after loading the view.
    }
    
    func fetchGuideJournals(uid: String){
        let db = Database.database().reference()
        let ref = db.child("Academic details").child("Journal details").child(uid)
        
        ref.observe(DataEventType.value) { (snap) in
            print("snap1 = \(snap)")
            let event = snap.value as? [String:Any]
            print("event1 = \(event)")
            for (key1,value1) in event!
            {
                let ref =  db.child("Academic details").child("Journal details").child(uid).child(key1)
                
                print("key1:",key1)
                ref.observe(DataEventType.value) { (snap) in
                    print("snap2 = \(snap)")
                    let event = snap.value as? [String:Any]
                    print("event2 = \(event)")
                    let obj = Admindatamodel().journalsdata(data: (event as! [String:Any]!))
                    //(data:[String:Any])
                    
                    self.GuideArray.append(obj)
                    print("subArray = \(self.GuideArray.count)")
                    self.JournalTableview.reloadData()
                    
                    
                }
            }
            
            
        }
        
        
    }
    func fetchGuideConferences(uid: String){
        let db = Database.database().reference()
        let ref = db.child("Academic details").child("Conferences details").child(uid)
        
        ref.observe(DataEventType.value) { (snap) in
            print("snap1 = \(snap)")
            let event = snap.value as? [String:Any]
            print("event1 = \(event)")
            for (key1,value1) in event!
            {
                let ref =  db.child("Academic details").child("Conferences details").child(uid).child(key1)
                
                print("key1:",key1)
                ref.observe(DataEventType.value) { (snap) in
                    print("snap2 = \(snap)")
                    let event = snap.value as? [String:Any]
                    print("event2 = \(event)")
                    let obj = Admindatamodel().conferencesdata(data: (event as! [String:Any]!))
                    //(data:[String:Any])
                    
                    self.GuideArray2.append(obj)
                    print("subArray = \(self.GuideArray2.count)")
                    self.ConferenceTableView.reloadData()
                    
                    
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
