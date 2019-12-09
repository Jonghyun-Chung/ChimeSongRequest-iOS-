//
//  SongTableViewCell.swift
//  final_ios
//
//  Created by Jonghyun Chung on 2019. 11. 20..
//  Copyright © 2019 Jonghyun Chung. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    var songNameLabel: UILabel!
    var songReasonLabel: UILabel!
    var songDetailsLabel: UILabel!
    var heartImageView: UIImageView!
    var emptyHeartImageView: UIImageView!

    let emptyHeartImageLength: CGFloat = 17
    let heartImageLength: CGFloat = 20
    let padding: CGFloat = 7
    let labelHeight: CGFloat = 14
    let swiftColor = UIColor(red: 1, green: 1, blue: 0.4, alpha: 1)

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        songNameLabel = UILabel()
        songNameLabel.font = UIFont.systemFont(ofSize: 14)
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songNameLabel)
        
        songReasonLabel = UILabel()
        songReasonLabel.font = UIFont.systemFont(ofSize: 12)
        songReasonLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songReasonLabel)
        
        songDetailsLabel = UILabel()
        songDetailsLabel.font = UIFont.systemFont(ofSize: 12)
        songDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songDetailsLabel)
        
        emptyHeartImageView = UIImageView(image: UIImage(named: "heart-1"))
        emptyHeartImageView.contentMode = .scaleAspectFit
        emptyHeartImageView.isHidden = false
        emptyHeartImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(emptyHeartImageView)
        
        heartImageView = UIImageView(image: UIImage(named: "heart"))
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.isHidden = true
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(heartImageView)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            songNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            songNameLabel.heightAnchor.constraint(equalToConstant: 18),
            songNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
            ])
        
        NSLayoutConstraint.activate([
            songReasonLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            songReasonLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            songReasonLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: padding)
            ])
        
        NSLayoutConstraint.activate([
            songDetailsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            songDetailsLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            songDetailsLabel.topAnchor.constraint(equalTo: songReasonLabel.bottomAnchor, constant: padding)
            ])
        
        NSLayoutConstraint.activate([
            emptyHeartImageView.widthAnchor.constraint(equalToConstant: emptyHeartImageLength),
            emptyHeartImageView.heightAnchor.constraint(equalToConstant: emptyHeartImageLength),
            emptyHeartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            emptyHeartImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            heartImageView.widthAnchor.constraint(equalToConstant: heartImageLength),
            heartImageView.heightAnchor.constraint(equalToConstant: heartImageLength),
            heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            heartImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
    }
    
    func configure(for song: Song) {
        songNameLabel.text = "Song name: " + song.songName
        songReasonLabel.text = "Reason: " + song.songReason
        songDetailsLabel.text = "Details: " + song.songDetails
}
    func toggleHeart(for isFavorite: Bool) {
        heartImageView.isHidden = !isFavorite
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
