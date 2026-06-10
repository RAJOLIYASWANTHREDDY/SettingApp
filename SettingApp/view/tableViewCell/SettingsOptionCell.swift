//
//  SettingsOptionCell.swift
//  SettingApp
//
//  Created by yaswanth reddy on 6/1/26.
//

import UIKit

class SettingsOptionCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with item: Setting) {
            label.text = item.title
            imageIcon.image = UIImage(systemName: item.iconName)
        }

}
