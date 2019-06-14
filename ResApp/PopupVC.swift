//
//  PopupVC.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 04/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class PopupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func facilitySelect(_ sender: UIButton) {
    }
    
    @IBAction func guideSelect(_ sender: UIButton) {
     performSegue(withIdentifier: "tabbar", sender: sender)
        
    }
    
    
    @IBAction func scholarSelect(_ sender: UIButton) {
    }
    
    
    
    @IBAction func backfromPopup(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
    
}
