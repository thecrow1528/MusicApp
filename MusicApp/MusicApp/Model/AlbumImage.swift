//
//  AlbumImage.swift
//  MusicApp
//
//  Created by Mirza Durakovic on 18/01/2018.
//  Copyright © 2018 Mirza Durakovic. All rights reserved.
//

import Foundation

class AlbumImage{
    //MARK: Properties
    var _urlText: String?
    
    //MARK: Computed properties
    
    var urlText: String{
        get{ return _urlText ?? String() }
        set{ _urlText = newValue }
    }
    
    
}
