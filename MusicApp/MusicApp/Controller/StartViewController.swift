//
//  StartViewController.swift
//  MusicApp
//
//  Created by Mirza Durakovic on 12/01/2018.
//  Copyright © 2018 Mirza Durakovic. All rights reserved.
//

import UIKit
import Alamofire

class StartViewController: UIViewController {
    
    // MARK: Properties:
    
    static var albumCover = [String: UIImage]()
    let  searchBar = UISearchBar()
    var artists = [Artist]()
    var album2 = [Album]()
    var indexCell: Int?
    
    
    // MARK: @IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    // MARK: ViewContoller
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        addSearchBarToNavigationBar()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewContoller = segue.destination as? DetailViewController{
            if let index = indexCell{
                viewContoller.setID(albumByID: album2[index].albumID)
            }
        }
    }
    
    // MARK: Custom func:
    func addSearchBarToNavigationBar() {
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Search Artists"
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        
    }
    
    
    
}

// MARK: CollectionView
extension StartViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album2.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let album = album2[indexPath.row]
        cell.set(name: album.albumName)
        cell.setCover(artCover: album.albumImage, albumID: album.albumID)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexCell = indexPath.row
        performSegue(withIdentifier: "putanja", sender: nil)
    }
    
}


// MARK: UISearchBarDelegate
extension StartViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text?.replacingOccurrences(of: " ", with: ""){
            self.artists.removeAll()
            self.album2.removeAll()
            getArtist(searchParam: text)
        }
        self.collectionView.reloadData()
        self.searchBar.endEditing(true)
    }
    
}


// MARK: Networking
extension StartViewController {
    
    func getArtist(searchParam: String){
        let apiKey = "65577611cd8c1c9798d19b322dbbf997"
        
        let artistUrlString = "http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=\(searchParam)&api_key=\(apiKey)&format=json"
        
        if let artistUrl = URL(string: artistUrlString) {
            Alamofire.request(artistUrl, method: .get, parameters: nil, headers: nil).responseJSON { response in
                let clearResponse = response.result.value as? [String: Any] ?? [:]
                // print(clearResponse)
                if let topAlbums = clearResponse["topalbums"] as? [String: Any] {
                    if let albums = topAlbums["album"] as? [[String:Any]]{
                        self.artists.removeAll()
                        for album in albums {
                            let album1 = Album()
                            let artist1 = Artist()
                            if  let albname = album["name"] as? String{album1.albumName = albname}
                            if let albumId = album["mbid"] as? String{album1.albumID = albumId}
                            if let artist = album["artist"] as? [String: Any]{
                                if let artistName = artist["name"] as? String {artist1.name = artistName}
                                if let images = album["image"] as? [[String:Any]] {
                                    let image = images[2]
                                    if let imageDict = image["#text"] as? String {album1.albumImage = imageDict}
                                }
                            }
                             self.artists.append(artist1)
                            self.album2.append(album1)
                        }
                         self.collectionView.reloadData()
                    }
                }
            }
        }
        
    }
}


