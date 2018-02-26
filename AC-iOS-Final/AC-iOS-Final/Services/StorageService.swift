//
//  StorageService.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import FirebaseStorage

class StorageService {
    private init() {
        self.storageRef = Storage.storage().reference()
        
    }
    static let manager = StorageService()
    private let storageRef: StorageReference!
    
    
   public func uploadImage(image: UIImage, imageID: String, completion: @escaping (_ error: Error?) -> Void) -> StorageUploadTask? {
        let ref = storageRef.child(imageID)
        guard let imageToUpload = UIImageJPEGRepresentation(image, 0.5) else { return nil}
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        return ref.putData(imageToUpload, metadata: metadata)
    }
    
  
    
    
}
