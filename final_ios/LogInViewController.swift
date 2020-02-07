//
//  LogInViewController.swift
//  final_ios
//
//  Created by Jonghyun Chung on 12/8/19.
//  Copyright © 2019 Jonghyun Chung. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    var pushViewControllerButton: UIButton!
    var descriptionTextView1: UITextView!
    var textField1: UITextView!
    let swiftColor = UIColor(red: 1, green: 1, blue: 0.4, alpha: 1)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Chime Song Request"
        label.font = UIFont(name: "Avenir-Light", size: 40)
        label.textColor = UIColor(white: 1, alpha: 0.9)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log In"
        
        assignbackground()
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        descriptionTextView1 = UITextView()
        descriptionTextView1.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView1.text = "  User Name"
        descriptionTextView1.isEditable = false
        descriptionTextView1.layer.cornerRadius = 10.0
        descriptionTextView1.backgroundColor = swiftColor.withAlphaComponent(0.7)
        descriptionTextView1.font = UIFont.systemFont(ofSize: 15)
        descriptionTextView1.textColor = .black
        view.addSubview(descriptionTextView1)
        
        textField1 = UITextView()
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField1.delegate = self
        textField1.text = "Enter your name."
        textField1.backgroundColor = .white
        textField1.isEditable = true
        textField1.font = UIFont.systemFont(ofSize: 15)
        textField1.textColor = .black
        textField1.clipsToBounds = true
        textField1.layer.cornerRadius = 10.0
        textField1.layer.borderWidth = 2
        textField1.layer.borderColor = UIColor.green.cgColor
        view.addSubview(textField1)
        
        pushViewControllerButton = UIButton()
        pushViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        pushViewControllerButton.setTitle("Sign In", for: .normal)
        pushViewControllerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        pushViewControllerButton.setTitleColor(.black, for: .normal)
        pushViewControllerButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        pushViewControllerButton.backgroundColor = swiftColor.withAlphaComponent(0.7)
        pushViewControllerButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        pushViewControllerButton.layer.cornerRadius = 25
        pushViewControllerButton.clipsToBounds = true
        pushViewControllerButton.layer.borderWidth = 2
        pushViewControllerButton.layer.borderColor = UIColor.green.cgColor
        pushViewControllerButton.alpha = 0.9
        view.addSubview(pushViewControllerButton)
        
        setupConstraints()

    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            descriptionTextView1.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            descriptionTextView1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            descriptionTextView1.heightAnchor.constraint(equalToConstant: 30),
            descriptionTextView1.widthAnchor.constraint(equalToConstant: 300)
            ])
        NSLayoutConstraint.activate([
            textField1.topAnchor.constraint(equalTo: descriptionTextView1.bottomAnchor, constant: 10),
            textField1.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            textField1.heightAnchor.constraint(equalToConstant: 80),
            textField1.widthAnchor.constraint(equalToConstant: 300)
            ])
        NSLayoutConstraint.activate([
            pushViewControllerButton.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 10),
            pushViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushViewControllerButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    @objc func pushNavViewController() {
        let viewController0 = ViewController()

        if let username = textField1.text {
            NetworkManager.createUser(fromUserName: username){ user in
                self.textField1.text = user.name
            }
            viewController0.userName = username
            navigationController?.pushViewController(viewController0, animated: true)
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
extension LogInViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textField1.text &&
            textView.text == "Enter your name." {
            textField1.text = ""
        }
}
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = "Enter your name."
        }
    }
    @objc func dismissViewControllerAndSaveText() {
        if let text = textField1.text, text != "" {
        }
        dismiss(animated: true, completion: nil)
}
}
