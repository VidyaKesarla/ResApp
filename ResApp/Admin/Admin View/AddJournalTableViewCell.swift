//
//  AddJournalTableViewCell.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 09/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class AddJournalTableViewCell: UITableViewCell {
    @IBOutlet weak var journalname: UILabel!
    
    @IBOutlet weak var publicationcitation: UILabel!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var papertitle: UILabel!
    @IBOutlet weak var coauthorname: UILabel!
    
    @IBOutlet weak var slno: UILabel!
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
