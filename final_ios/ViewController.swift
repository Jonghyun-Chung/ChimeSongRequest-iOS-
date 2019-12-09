//
//  ViewController.swift
//  final_ios
//
//  Created by Jonghyun Chung on 2019. 11. 20..
//  Copyright © 2019 Jonghyun Chung. All rights reserved.
//

import UIKit
//UITableViewDataSource
//protocol SaveInfoButtonTextDelegate: class {
//    func saveInfoButtonText(to newString: String)
//}

class ViewController: UIViewController {
    
    var pushNavViewControllerButton1: UIButton!
    var pushNavViewControllerButton2: UIButton!
    var userName: String!
    var songName: String!
    var songReason: String!
    var songDetails: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        let swiftColor2 = UIColor(red: 0.6, green: 1, blue: 0.4, alpha: 1)
        assignbackground()
        

        title = "Chime Song Requester"

        pushNavViewControllerButton1 = UIButton()
        pushNavViewControllerButton1.translatesAutoresizingMaskIntoConstraints = false
        pushNavViewControllerButton1.setTitle("Request a Song", for: .normal)
        pushNavViewControllerButton1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        pushNavViewControllerButton1.setTitleColor(.black, for: .normal)
        pushNavViewControllerButton1.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        pushNavViewControllerButton1.backgroundColor = swiftColor2.withAlphaComponent(0.7)
        pushNavViewControllerButton1.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        pushNavViewControllerButton1.layer.cornerRadius = 25
        pushNavViewControllerButton1.clipsToBounds = true
        pushNavViewControllerButton1.layer.borderWidth = 2
        pushNavViewControllerButton1.layer.borderColor = UIColor.green.cgColor
        pushNavViewControllerButton1.alpha = 0.9
        view.addSubview(pushNavViewControllerButton1)
        
        pushNavViewControllerButton2 = UIButton()
        pushNavViewControllerButton2.translatesAutoresizingMaskIntoConstraints = false
        pushNavViewControllerButton2.setTitle("View Requested Songs", for: .normal)
        pushNavViewControllerButton2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        pushNavViewControllerButton2.setTitleColor(.black, for: .normal)
        pushNavViewControllerButton2.addTarget(self, action: #selector(pushNavViewController2), for: .touchUpInside)
        pushNavViewControllerButton2.backgroundColor = swiftColor2.withAlphaComponent(0.7)
        pushNavViewControllerButton2.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        pushNavViewControllerButton2.layer.cornerRadius = 25
        pushNavViewControllerButton2.clipsToBounds = true
        pushNavViewControllerButton2.layer.borderWidth = 2
        pushNavViewControllerButton2.layer.borderColor = UIColor.green.cgColor
        pushNavViewControllerButton2.alpha = 0.9
        view.addSubview(pushNavViewControllerButton2)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pushNavViewControllerButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushNavViewControllerButton1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            pushNavViewControllerButton1.heightAnchor.constraint(equalToConstant: 60)
            ])
        
        NSLayoutConstraint.activate([
            pushNavViewControllerButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushNavViewControllerButton2.topAnchor.constraint(equalTo: pushNavViewControllerButton1.bottomAnchor, constant: 120),
            pushNavViewControllerButton2.heightAnchor.constraint(equalToConstant: 60)
            ])
        
        
    }
    
    @objc func pushNavViewController() {
        let viewController1 = RequestViewController()
        viewController1.userName = self.userName
//        viewController1.delegate = self
        navigationController?.pushViewController(viewController1, animated: true)
    }
    
    @objc func pushNavViewController2() {
        let viewController2 = SongViewController()
//        viewController2.delegate = self
        navigationController?.pushViewController(viewController2, animated: true)
    }
    func assignbackground(){
        let background = UIImage(named: "chime_tower")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.alpha = 1.0
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    }




