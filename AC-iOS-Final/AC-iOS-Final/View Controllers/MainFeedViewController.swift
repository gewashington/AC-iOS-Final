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
    
    var posts = [Posts]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 500
        tableView.register(MainFeedTableViewCell.self, forCellReuseIdentifier: "MainFeedCell")
        loadData()
        
    }
    
    func loadData() {
        DatabaseService.manager.getEveryPost { (onlinePosts) in
            self.posts = onlinePosts
        }
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
        storageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let data = data {
                cell.postImage.image = UIImage(data: data)
            }
            else if let error = error {
                print(error.localizedDescription)
            }
            else {
                cell.postImage.image = #imageLiteral(resourceName: "camera_icon")
            }
        }
        return cell
    }
    
}
