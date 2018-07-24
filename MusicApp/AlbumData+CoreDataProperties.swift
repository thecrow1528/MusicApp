//
//  AlbumData+CoreDataProperties.swift
//  
//
//  Created by Mirza Durakovic on 04/03/2018.
//
//

import Foundation
import CoreData


extension AlbumData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlbumData> {
        return NSFetchRequest<AlbumData>(entityName: "AlbumData")
    }

    @NSManaged public var albumArtistData: String?
    @NSManaged public var albumNameData: String?

}
