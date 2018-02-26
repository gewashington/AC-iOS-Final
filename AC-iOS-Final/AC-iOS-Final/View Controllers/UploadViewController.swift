//
//  UploadViewController.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import Firebase
import AVFoundation
import MobileCoreServices

class UploadViewController: UIViewController {
    
    var ref: DatabaseReference!
    let uploadView = UploadView()
    private let imagePicker = UIImagePickerController()
    private var chosenImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUploadView()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(upload) )
        uploadView.imageAsButton.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
               imagePicker.delegate = self
       
    }
    
    private func setUpUploadView() {
        view.addSubview(uploadView)
        uploadView.snp.makeConstraints { view in
            view.size.equalTo(self.view.safeAreaLayoutGuide.snp.size)
        }
    }
    
    @objc private func upload() {
        self.ref = Database.database().reference()
        guard let comment = uploadView.uploadCommentTF.text, !comment.isEmpty else { print("commentField empty!"); return }
        DatabaseService.manager.createPost(ref: ref, image: chosenImage, comment: comment)
        print("Uploaded!")
        uploadView.uploadImageIV.image = #imageLiteral(resourceName: "camera_icon")
        chosenImage = nil
        uploadView.uploadCommentTF.text = ""
    }
    
    
    
    @objc private func chooseImage() {
        print("Choosing Image")
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
       
    }
}

extension UploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { print("Image is Nil"); return }
        uploadView.uploadImageIV.image = image
        chosenImage = image
        self.dismiss(animated: true, completion: nil)
    }
    

}
