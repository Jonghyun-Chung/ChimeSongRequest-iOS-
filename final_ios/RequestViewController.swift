//
//  RequestViewController.swift
//  final_ios
//
//  Created by Jonghyun Chung on 2019. 11. 22..
//  Copyright © 2019 Jonghyun Chung. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController {
    
    var descriptionTextView1: UITextView!
    var descriptionTextView2: UITextView!
    var descriptionTextView3: UITextView!
    var textField1: UITextView!
    var textField2: UITextView!
    var textField3: UITextView!
    var button: UIButton!
    var userName: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swiftColor = UIColor(red: 1, green: 1, blue: 0.4, alpha: 1)
        assignbackground()
        title = "Request a Song"

        descriptionTextView1 = UITextView()
        descriptionTextView1.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView1.text = "  Song Name"
        descriptionTextView1.isEditable = false
        descriptionTextView1.layer.cornerRadius = 10.0
        descriptionTextView1.backgroundColor = swiftColor.withAlphaComponent(0.7)
        descriptionTextView1.font = UIFont.systemFont(ofSize: 15)
        descriptionTextView1.textColor = .black
        view.addSubview(descriptionTextView1)
        
        descriptionTextView2 = UITextView()
        descriptionTextView2.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView2.text = "  Reason Why"
        descriptionTextView2.isEditable = false
        descriptionTextView2.layer.cornerRadius = 10.0
        descriptionTextView2.backgroundColor = swiftColor.withAlphaComponent(0.7)
        descriptionTextView2.font = UIFont.systemFont(ofSize: 15)
        descriptionTextView2.textColor = .black
        view.addSubview(descriptionTextView2)
        
        descriptionTextView3 = UITextView()
        descriptionTextView3.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView3.text = "  Other Details"
        descriptionTextView3.isEditable = false
        descriptionTextView3.layer.cornerRadius = 10.0
        descriptionTextView3.backgroundColor = swiftColor.withAlphaComponent(0.7)
        descriptionTextView3.font = UIFont.systemFont(ofSize: 15)
        descriptionTextView3.textColor = .black
        view.addSubview(descriptionTextView3)
        
        textField1 = UITextView()
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField1.delegate = self
        textField1.text = "Enter the name of the song you want to request"
        textField1.backgroundColor = .white
        textField1.isEditable = true
        textField1.font = UIFont.systemFont(ofSize: 15)
        textField1.textColor = .black
        textField1.clipsToBounds = true
        textField1.layer.cornerRadius = 10.0
        textField1.layer.borderWidth = 2
        textField1.layer.borderColor = UIColor.green.cgColor
        view.addSubview(textField1)
        
        textField2 = UITextView()
        textField2.translatesAutoresizingMaskIntoConstraints = false
        textField2.text = "Enter the reason why you want to \nrequest the song"
        textField2.backgroundColor = .white
        textField2.delegate = self
        textField2.isEditable = true
        textField2.font = UIFont.systemFont(ofSize: 15)
        textField2.clipsToBounds = true
        textField2.layer.cornerRadius = 10.0
        textField2.layer.borderWidth = 2
        textField2.layer.borderColor = UIColor.green.cgColor
        view.addSubview(textField2)
        
        textField3 = UITextView()
        textField3.translatesAutoresizingMaskIntoConstraints = false
        textField3.text = "Enter other details about the song. \nex) versions of the song"
        textField3.backgroundColor = .white
        textField3.delegate = self
        textField3.isEditable = true
        textField3.font = UIFont.systemFont(ofSize: 15)
        textField3.clipsToBounds = true
        textField3.layer.cornerRadius = 10.0
        textField3.layer.borderWidth = 2
        textField3.layer.borderColor = UIColor.green.cgColor
        view.addSubview(textField3)
        
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        button.setTitle("Submit Request", for: .normal)
        button.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        view.addSubview(button)

        setupConstraints()

    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            descriptionTextView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            descriptionTextView1.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            descriptionTextView1.heightAnchor.constraint(equalToConstant: 30),
            descriptionTextView1.widthAnchor.constraint(equalToConstant: 300)
            ])
        NSLayoutConstraint.activate([
            textField1.topAnchor.constraint(equalTo: descriptionTextView1.bottomAnchor, constant: 10),
            textField1.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            textField1.heightAnchor.constraint(equalToConstant: 170),
            textField1.widthAnchor.constraint(equalToConstant: 300)
            ])
        NSLayoutConstraint.activate([
            descriptionTextView2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
            descriptionTextView2.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            descriptionTextView2.heightAnchor.constraint(equalToConstant: 30),
            descriptionTextView2.widthAnchor.constraint(equalToConstant: 300)
            ])
        NSLayoutConstraint.activate([
            textField2.topAnchor.constraint(equalTo: descriptionTextView2.bottomAnchor, constant: 10),
            textField2.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            textField2.heightAnchor.constraint(equalToConstant: 170),
            textField2.widthAnchor.constraint(equalToConstant: 300)
            ])
        NSLayoutConstraint.activate([
            descriptionTextView3.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
            descriptionTextView3.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            descriptionTextView3.heightAnchor.constraint(equalToConstant: 30),
            descriptionTextView3.widthAnchor.constraint(equalToConstant: 300)
            ])
        NSLayoutConstraint.activate([
            textField3.topAnchor.constraint(equalTo: descriptionTextView3.bottomAnchor, constant: 10),
            textField3.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            textField3.heightAnchor.constraint(equalToConstant: 170),
            textField3.widthAnchor.constraint(equalToConstant: 300)
            ])
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: textField3.bottomAnchor, constant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 20),
            button.widthAnchor.constraint(equalToConstant: 150)
            ])
    }
    }
    

extension RequestViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == textField1 &&
            textView.text == "Enter the name of the song you want to request" {
            textField1.text = ""
        }
        if textView == textField2 &&
            textView.text == "Enter the reason why you want to \nrequest the song" {
            textField2.text = ""
        }
        if textView == textField3 &&
            textView.text == "Enter other details about the song. \nex) versions of the song" {
            textField3.text = ""
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = "Enter the name of the song you want to request"
        }
}
    
    @objc func pushNavViewController() {
        let viewController1 = ViewController()
        viewController1.songName = textField1.text
        viewController1.songReason = textField2.text
        viewController1.songDetails = textField3.text
        if let songName = textField1.text {
            NetworkManager.createSong(fromUserName: userName, fromSongName: textField1.text, fromSongReason: textField2.text, fromSongDetail: textField3.text) {song in
                self.textField1.text = song.songName
                self.textField2.text = song.songReason
                self.textField3.text = song.songDetails
                
            }
        navigationController?.pushViewController(viewController1, animated: true)
    }
    }
    func assignbackground(){
        let background = UIImage(named: "chime_tower")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}

