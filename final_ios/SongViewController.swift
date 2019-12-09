//
//  SongViewController.swift
//  final_ios
//
//  Created by Jonghyun Chung on 2019. 11. 20..
//  Copyright © 2019 Jonghyun Chung. All rights reserved.
//

import UIKit

//, UISearchResultsUpdating
class SongViewController: UIViewController {
    
    var tableView = UITableView()
    let songCellIdentifier = "SongCell"
    var searchController: UISearchController!
    let searchBy: SearchType = .songName
    var songs: [Song] = []
    let swiftColor = UIColor(red: 1, green: 1, blue: 0.4, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Request Details"
        view.backgroundColor = .white
//        assignbackground()
    
//        self.tableView.backgroundColor = swiftColor
//        self.tableView.delegate = self
        
        let fireworks = Song(songName: "Fireworks", songReason: "my birthday", songDetails: "remastered version from album ooo", likeSong: false, songUpvote: 5)
        let fakelove = Song(songName: "Fake Love", songReason: "my friend loves bts", songDetails: "ooo version", likeSong: false, songUpvote: 3)
        let twothousandtwo = Song(songName: "2002", songReason: "LOL", songDetails: "", likeSong: false, songUpvote: 10)
        
        songs = [fireworks, fakelove, twothousandtwo]
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: songCellIdentifier)
        tableView.backgroundColor = .clear

        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension

        searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self

        searchController.dimsBackgroundDuringPresentation = false

        searchController.searchBar.placeholder = searchBy == .songName ? "Search by Song Title": ""
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        view.addSubview(tableView)
        
        definesPresentationContext = true
        setupConstraints()
        
        
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    func assignbackground(){
        let background = UIImage(named: "chime_tower")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.center = view.center
        imageView.image = background
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}

extension SongViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: songCellIdentifier, for: indexPath) as!
        SongTableViewCell
        cell.songNameLabel.text = songs[indexPath.row].songName

        let song = songs[indexPath.row]
        cell.configure(for: song)
        cell.selectionStyle = .none
        return cell
    }
    
//    func updateSearchResults(for searchController: UISearchController) {
//        if let searchText = searchController.searchBar.text {
//            if !searchText.isEmpty {
//                switch searchBy {
//                case .songName:
//                    NetworkManager.getSong(fromSongName: searchText) { songs in
//                        self.songs = songs
//                        self.tableView.reloadData()
//                    }
//}
//            }
//        }
//    }
    func favoriteButtonTapped(row: Int) {
        let song = songs[row]
        
        if (!song.likeSong) {
        song.likeSong = true
        if let storedFavorites = userDefaults.data(forKey: "favorites"),
            var favorites = try? decoder.decode([Song].self, from: storedFavorites) {
            favorites.append(song)
            if let encodedFavorites = try? encoder.encode(favorites) {
            userDefaults.set(encodedFavorites, forKey: "favorites")
            }
        } else {
            let favorites = [song]
            if let encodedFavorites = try? encoder.encode(favorites) {
                userDefaults.set(encodedFavorites, forKey: "favorites")
            }
        }
}
    }}
extension SongViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! SongTableViewCell
        song.likeSong.toggle()
        cell.toggleHeart(for: song.likeSong)
    }
    
}


