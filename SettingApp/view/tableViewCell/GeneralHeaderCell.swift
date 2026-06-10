//
//  GeneralHeaderCell.swift
//  SettingApp
//
//  Created by yaswanth reddy on 6/1/26.
//

import UIKit

class GeneralHeaderCell: UITableViewCell {
    @IBOutlet weak var discrp: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var heading: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
