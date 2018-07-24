//
//  SongTableViewCell.swift
//  MusicApp
//
//  Created by Mirza Durakovic on 26/01/2018.
//  Copyright © 2018 Mirza Durakovic. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    //MARK: @IBOutlets
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var songTimeLabel: UILabel!
    

    //MARK: Custom func
    func secondsToMins(totalSecs: String) {
        
        let sec = Int(totalSecs)! % 60
        let min = Int(totalSecs)! / 60
        if sec < 10{
            let totalMins = String(min) + ":0" + String(sec)
             songTimeLabel.text = String(totalMins)
        }
        else{
            let totalMins = String(min) + ":" + String(sec)
            songTimeLabel.text = String(totalMins)
        }
        
    }
    
    func setSongData(songName: String){
        songNameLabel.text = songName
    }

    

}
