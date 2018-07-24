//
//  Artist.swift
//  MusicApp
//
//  Created by Mirza Durakovic on 18/01/2018.
//  Copyright © 2018 Mirza Durakovic. All rights reserved.
//

import Foundation

class Artist {
    // MARK: Properties
    var _name: String?
    var _url: String?
    
    // MARK: Computed Properties
    
    var name: String{
        get{return _name ?? String()}
        set{_name = newValue}
    }
    
    var url:String{
        get{return _url ?? String()}
        set{_url = newValue}
    }
    
    
}
