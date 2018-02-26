//
//  DatabaseService.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseDatabase
import Kingfisher


class DatabaseService {
    private init() {
        dbRef = Database.database().reference()
        currentUser = Auth.auth().currentUser!
    }
    static let manager = DatabaseService()
    private var dbRef: DatabaseReference!
    private var currentUser: User!
    private var postsRef: DatabaseReference!
    
    public func createPost(ref: DatabaseReference, image: UIImage, comment: String) {
        guard (currentUser) != nil else { print("Error getting user!"); return }
        let ref = dbRef.child("posts").child("comments").childByAutoId()
        let newPost = Posts(postId: ref.key, comment: comment)
        ref.setValue(newPost.toAnyObject())
        
        StorageService.manager.uploadImage(image: image, imageID: ref.key) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }
    
    public func getEveryPost(completion: @escaping (_ posts: [Posts]) -> Void) {
        dbRef.child("posts").child("comments").observe((.value)) { (snapshot) in
            var posts = [Posts]()
            guard let postSnapShots = snapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            for snapshot in postSnapShots {
                guard let postDict = snapshot.value as? [String: Any] else {
                    return
                }
                guard let postID = postDict["postId"] as? String, let comment = postDict["comment"] as? String else { print("error retrieving posts)"); return }
                let post = Posts(postId: postID, image: postID, comment: comment)
                posts.append(post)
            }
            completion(posts)
            
            
        }
        
    }
}
