//
//  cust1ViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 04/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import FirebaseAuth

class cust1ViewController: ViewController {

    @IBAction func cse(_ sender: UIButton) {
    }
    
    
    @IBAction func ise(_ sender: UIButton) {
    }
    @IBAction func civil(_ sender: UIButton) {
    }
    
    
    @IBAction func mech(_ sender: UIButton) {
    }
    
    
    @IBAction func eee(_ sender: UIButton) {
    }
    
    
    @IBAction func ece(_ sender: UIButton) {
    }
    
    
    @IBAction func logout(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
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
