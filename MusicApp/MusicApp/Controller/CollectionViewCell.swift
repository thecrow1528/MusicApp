//
//  CollectionViewCell.swift
//  MusicApp
//
//  Created by Mirza Durakovic on 12/01/2018.
//  Copyright © 2018 Mirza Durakovic. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CollectionViewCell: UICollectionViewCell {
    //MARK: Properties
    
    var request: DataRequest?
    
    //MARK: @IBOutlets
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        request?.cancel()
        coverImageView.image = #imageLiteral(resourceName: "album-art-empty")
    }
    
    //MARK: Label and CoverImage setting
    func set(name: String){
        albumNameLabel.text = name
    }
    
    func setCover(artCover:String, albumID: String){
        if let url = URL(string: artCover){
            request = Alamofire.request(url).responseImage { response in
                if let image = response.result.value {
                    self.coverImageView.image = image
                    StartViewController.albumCover[albumID] = image
                } else {
                    self.coverImageView.image = #imageLiteral(resourceName: "album-art-empty")
                    StartViewController.albumCover[albumID] = #imageLiteral(resourceName: "album-art-empty")
                }
            }
        } else {
            self.coverImageView.image = #imageLiteral(resourceName: "album-art-empty")
            StartViewController.albumCover[albumID] = #imageLiteral(resourceName: "album-art-empty")
        }
    }
    
}
