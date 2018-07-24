//
//  DetailViewController.swift
//  MusicApp
//
//  Created by Mirza Durakovic on 26/01/2018.
//  Copyright © 2018 Mirza Durakovic. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    //MARK: @IBAction
    
    
    //MARK: Properties
    
    var album_ID: String?
    let album = Album()
    let artist = Artist()
    var tracks = [Tracks]()
    
    //MARK: @IBOutlets
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setStoryboardView()
        self.albumImage.contentMode = .scaleAspectFill
        
    }

    //MARK: Custom funcs
    func setID (albumByID: String) {album_ID = albumByID}
    
    func setStoryboardView() {
        if let id = album_ID{
            getAlbum(mbid: id)
        }
    }
    
    func setData(){
        albumImage.image = StartViewController.albumCover[album_ID!]
        albumImage.layer.borderWidth = 0.50
        albumImage.layer.borderColor = UIColor.black.cgColor
        self.title = album.albumName
        artistNameLabel.text = artist.name
        albumNameLabel.text = album.albumName
    }
    
}

//MARK: Networking
extension DetailViewController {
    func getAlbum(mbid: String){
        let apiKey = "65577611cd8c1c9798d19b322dbbf997"
        let getAlbumUrl = "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=\(apiKey)&mbid=\(mbid)&format=json"
        
        if let albumUrl = URL(string: getAlbumUrl){
            Alamofire.request(albumUrl, method: .get, parameters: nil, headers: nil).responseJSON { response in
                let clearResponse = response.result.value as? [String: Any] ?? [:]
                if let album = clearResponse["album"] as? [String: Any]{
                    if let name = album["name"] as? String {self.album.albumName = name}
                    if let artistName = album["artist"] as? String {self.artist.name = artistName}
                    if let tracks = album["tracks"] as? [String: Any] {
                        if let track = tracks["track"] as? [[String: Any]]{
                            for trackName in track {
                                let track1 = Tracks ()
                                if let trName = trackName["name"] as? String {track1.trackName = trName}
                                if let trTime = trackName["duration"] as? String {track1.trackTime = trTime}
                               self.tracks.append(track1)
                            }
                        
                            self.tableView.reloadData()
                            
                        }
                    }
                }
                self.setData()
            }
        }
    }
}


//MARK: UITablewiew funcs

extension DetailViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! SongTableViewCell
        let track = tracks[indexPath.row]
        cell.setSongData(songName: track.trackName)
        cell.secondsToMins(totalSecs: track.trackTime)
        
        return cell
    }
}
