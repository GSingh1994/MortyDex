//
//  ImageCell.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-27.
//

import UIKit

class ImageCell: UITableViewCell {
    @IBOutlet weak var imageCellView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
