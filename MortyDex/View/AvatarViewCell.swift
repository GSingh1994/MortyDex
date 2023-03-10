//
//  AvatarViewCell.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-28.
//

import UIKit

class AvatarViewCell: UITableViewCell {
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leftLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        leftImageView.layer.masksToBounds = true
        leftImageView.layer.cornerRadius = leftImageView.frame.size.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
