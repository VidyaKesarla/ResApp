//
//  scholardisplayTableViewCell.swift
//  FirebaseAuth
//
//  Created by IOSLevel01 on 08/04/19.
//

import UIKit

class scholardisplayTableViewCell: UITableViewCell {

    @IBOutlet weak var schuid: UILabel!
    @IBOutlet weak var scholarname: UILabel!
    @IBOutlet weak var scholarimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
