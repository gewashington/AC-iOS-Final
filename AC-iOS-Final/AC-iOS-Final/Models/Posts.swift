//
//  Posts.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class Posts {
    let postId: String
    var comment: String?
    var image: String?

    init(postId: String, comment: String?) {
        self.postId = postId
        self.comment = comment
    }
    
    init(postId: String, image: String?) {
        self.postId = postId
        self.image = image
    }
    
    init(postId: String, image: String?, comment: String?) {
        self.postId = postId
        self.image = image
        self.comment = comment
    }
//
//    init(snapShot: DataSnapshot) {
//        let value = snapShot.value as? [String:Any]
//        self.ref = snapShot.ref
//        self.postId = value?["postID"] as? String ?? ""
//
//    }
    
    func toAnyObject () -> [String:Any] {
        return ["postId": postId,"comment": comment! ]
}
}
