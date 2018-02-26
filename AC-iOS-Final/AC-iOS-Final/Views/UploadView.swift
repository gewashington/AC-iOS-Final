//
//  UploadView.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import SnapKit

class UploadView: UIView {

    lazy var uploadImageIV: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "camera_icon")
        iv.backgroundColor = .gray
        iv.contentMode = UIViewContentMode.scaleToFill
        return iv
    }()
    
    lazy var imageAsButton: UIButton = {
        let butt = UIButton()
        butt.backgroundColor = .clear
        return butt
    }()
    
    lazy var uploadCommentTF: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .blue
        tf.placeholder = "Add description here"
        return tf
    }()
    
    
    
        override init(frame: CGRect) {
            super.init(frame: UIScreen.main.bounds)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        private func commonInit() {
            backgroundColor = .white
            setupViews()
        }
        
        private func setupViews() {
            let views = [imageAsButton, uploadImageIV, uploadCommentTF] as [UIView]
            views.forEach { addSubview($0) }
            setUpUploadIV()
            setUpUploadCommentTF()
            setUpImageButton()
        }
    
    private func setUpUploadIV() {
        uploadImageIV.snp.makeConstraints { iv in
            iv.height.equalTo(self.snp.height).multipliedBy(0.6)
            iv.width.equalTo(self.snp.width)
            iv.centerX.equalTo(self.snp.centerX)
            iv.top.equalTo(self.snp.top).offset(30)
        }
    }
    
    private func setUpUploadCommentTF() {
        uploadCommentTF.snp.makeConstraints { tf in
            tf.height.equalTo(self.snp.height).multipliedBy(0.3)
            tf.width.equalTo(self.snp.width).multipliedBy(0.8)
            tf.centerX.equalTo(self.snp.centerX)
            tf.top.equalTo(uploadImageIV.snp.bottom).offset(10)
        }
    }
    
    private func setUpImageButton() {
        imageAsButton.snp.makeConstraints { butt in
            butt.height.equalTo(uploadImageIV.snp.height)
            butt.width.equalTo(uploadImageIV.snp.width)
            butt.centerX.equalTo(uploadImageIV.snp.centerX)
            butt.top.equalTo(uploadImageIV.snp.top)
        }
    }

}
