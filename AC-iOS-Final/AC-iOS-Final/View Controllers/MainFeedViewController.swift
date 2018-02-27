//
//  MainFeedViewController.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import Firebase
import FirebaseStorage

class MainFeedViewController: UITableViewController {
    
    var storageDB: Storage!
    
    private var firebaseAuth = FirebaseAuthorization()
    
    var posts = [Posts]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        firebaseAuth.delegate = self
        tableView.register(MainFeedTableViewCell.self, forCellReuseIdentifier: "MainFeedCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 600
        self.tableView.layoutSubviews()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOut) )
        loadData()
        
    }
    
    private func loadData() {
        DatabaseService.manager.getEveryPost { (onlinePosts) in
            self.posts = onlinePosts
        }
    }
    
    @objc private func logOut() {
        firebaseAuth.signOutUser()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainFeedCell", for: indexPath) as! MainFeedTableViewCell
        let post = posts[indexPath.row]
        cell.postComment.text = post.comment
        cell.postImage.image = nil
        let storageRef = Storage.storage().reference(withPath: post.image!)
        storageRef.getData(maxSize: 1 * 2560 * 2560) { (data, error) in
            if let data = data {
                cell.postImage.image = UIImage(data: data)
                cell.postImage.layoutIfNeeded()
            }
            else if let error = error {
                print(error.localizedDescription)
            }
            else {
                cell.postImage.image = #imageLiteral(resourceName: "camera_icon")
                cell.postImage.layoutIfNeeded()
            }
        }
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
}

extension MainFeedViewController: FirebaseAuthDelegate {
    func didSignout(_ userService: FirebaseAuthorization) {
        print("Successful logout")
        let loginVC = UINavigationController(rootViewController: LoginViewController())
        present(loginVC, animated: true, completion: nil)
    }
}
