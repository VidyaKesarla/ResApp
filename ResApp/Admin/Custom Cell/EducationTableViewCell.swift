//
//  EducationTableViewCell.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 09/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class EducationTableViewCell: UITableViewCell {
    @IBOutlet weak var university: UILabel!
    
    @IBOutlet weak var yop: UILabel!
    @IBOutlet weak var specialisation: UILabel!
    @IBOutlet weak var branch: UILabel!
    @IBOutlet weak var degree: UILabel!
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
