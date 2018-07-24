//
//  Tracks.swift
//  MusicApp
//
//  Created by Mirza Durakovic on 26/01/2018.
//  Copyright © 2018 Mirza Durakovic. All rights reserved.
//

import Foundation

class Tracks{
    //MARK: Properties
    var _trackName: String?
    var _trackTime: String?

    
    //MARK: Computed properties:
    
    var trackName: String{
        get{return _trackName ?? String()}
        set{_trackName = newValue}
    }
    var trackTime: String{
        get{return _trackTime ?? String()}
        set{_trackTime = newValue}
    }
}
