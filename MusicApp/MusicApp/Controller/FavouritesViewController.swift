//
//  FavouritesViewController.swift
//  MusicApp
//
//  Created by Mirza Durakovic on 18/02/2018.
//  Copyright © 2018 Mirza Durakovic. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController {
    //MARK: Properties:
    var favAlbum = [AlbumData]()
    //MARK: @IBOutlets
    
    @IBOutlet weak var favTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favTableView.delegate = self
        favTableView.dataSource = self
        favTableView.rowHeight = UITableViewAutomaticDimension
        favTableView.estimatedRowHeight = 80
        self.favTableView.reloadData()
    }

    

}

extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favAlbum.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "favCell") as! FavTableViewCell
        return cell
    }
    
}
