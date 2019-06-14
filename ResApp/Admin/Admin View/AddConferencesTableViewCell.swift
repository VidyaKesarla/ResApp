//
//  AddConferencesTableViewCell.swift
//  
//
//  Created by Vidya Srinivasa Kesarla on 05/05/19.
//

import UIKit

class AddConferencesTableViewCell: UITableViewCell {
    @IBOutlet weak var citation: UILabel!
    
    @IBOutlet weak var slno: UILabel!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var conferencename: UILabel!
    @IBOutlet weak var papertitle: UILabel!
    @IBOutlet weak var coauthorname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
