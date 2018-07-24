//
//  FavTableViewCell.swift
//  MusicApp
//
//  Created by Mirza Durakovic on 18/02/2018.
//  Copyright © 2018 Mirza Durakovic. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    //MARK: @IBOutlets
    @IBOutlet weak var favAlbumNameLabel: UILabel!
    @IBOutlet weak var favAlbumArtistNameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
