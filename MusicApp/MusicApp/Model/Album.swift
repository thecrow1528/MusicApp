//
//  Album.swift
//  MusicApp
//
//  Created by Mirza Durakovic on 18/01/2018.
//  Copyright © 2018 Mirza Durakovic. All rights reserved.
//

import Foundation

class Album{
    //MARK: Properties
    var _albumName: String?
    var _albumImage: String?
    var _albumID: String?
    
    //MARK: ComputedProperties
    
    var albumName: String{
        get{return _albumName ?? String()}
        set{_albumName = newValue}
    }
    var albumImage: String {
        get{return _albumImage ?? String()}
        set{_albumImage = newValue}
    }
    var albumID: String{
        get{return _albumID ?? String()}
        set{_albumID = newValue}
    }
}
