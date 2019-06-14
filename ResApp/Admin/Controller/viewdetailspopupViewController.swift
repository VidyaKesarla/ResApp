//
//  viewdetailspopupViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 04/05/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase
protocol detailproto
{
    func selectingDetail(Seelcted:String)
}

class viewdetailspopupViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let details1 = [("Basic & education details"),("Service and membership details"),("Journals & conferences details")]
    
    @IBOutlet weak var detailsTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "detailpopup", for: indexPath) as! detailsTableViewCell
        cell.details.text = details1[indexPath.row]
    return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = tableView.indexPathForSelectedRow
        let vc = UIStoryboard(name: "AdminStoryboard", bundle: nil).instantiateViewController(withIdentifier: "BasicDetails") as! AddEducationViewController
        let vc2 = UIStoryboard(name: "AdminStoryboard", bundle: nil).instantiateViewController(withIdentifier: "TeachingDetails") as! AddTeachingViewController
        let vc3 = UIStoryboard(name: "AdminStoryboard", bundle: nil).instantiateViewController(withIdentifier: "J&CDetails") as! AddMembershipViewController
        if((indexPath.row) == 0) {
            //appdelegate.dept = "cse"
            //print("cse")
            self.present(vc, animated: true, completion: nil)
            
        }
        else if((indexPath.row) == 1) {
            self.present(vc2, animated: true, completion: nil)
            
        }
        else if((indexPath.row) == 2) {
            
            self.present(vc3, animated: true, completion: nil)
            
        }
    }
       
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

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
