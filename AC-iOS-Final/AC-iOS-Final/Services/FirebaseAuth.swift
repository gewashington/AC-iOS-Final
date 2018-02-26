//
//  FirebaseAuth.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

@objc protocol FirebaseAuthDelegate: class {
    //create user delegate protocols
    @objc optional func didFailCreatingUser(_ userService: FirebaseAuthorization, error: Error)
    @objc optional func didCreateUser(_ userService: FirebaseAuthorization, user: User)
    
    //log in delegate protocols
    @objc optional func didFailSigningIn(_ userService: FirebaseAuthorization, error: Error)
    @objc optional func didSignIn(_ userService: FirebaseAuthorization, user: User )
    
    //log out delegate protocols
    //    @objc optional func didFailSigningOut(_ userService: FirebaseAuthorization, error: Error)
    @objc optional func didSignout(_ userService: FirebaseAuthorization)
}

class FirebaseAuthorization: NSObject {
    weak var delegate: FirebaseAuthDelegate?
    
    public func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.delegate?.didFailCreatingUser?(self, error: error)
            }
            else if let user = user  {
                self.delegate?.didCreateUser?(self, user: user)
            }
        }
        
    }
    
    public func signInUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { ( user, error) in
            if let error = error {
                self.delegate?.didFailSigningIn?(self, error: error)
            }
            else if let user = Auth.auth().currentUser {
                self.delegate?.didSignIn?(self, user: user)
            }
        }
    }
    
    public func signOutUser() {
        do {
            try! Auth.auth().signOut()
            self.delegate?.didSignout?(self)
        }
        
    }
}
