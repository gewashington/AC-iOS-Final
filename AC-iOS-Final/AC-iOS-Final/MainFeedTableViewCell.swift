//
//  MainFeedTableViewCell.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import SnapKit

class MainFeedTableViewCell: UITableViewCell {
    
    lazy var postImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .lightGray
        iv.contentMode = UIViewContentMode.scaleAspectFit
        return iv
    }()
    
    lazy var postComment: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .cyan
        tv.isEditable = false
        tv.isSelectable = false
        return tv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: "MainFeedCell")
        setUpSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func setUpSubviews() {
        let views = [postImage, postComment] as [UIView]
        views.forEach { addSubview($0) }
        setUpImageView()
        setUpTextView()
    }
    
    private func setUpImageView() {
        postImage.snp.makeConstraints { iv in
            iv.top.equalTo(self.snp.top)
            iv.height.equalTo(self.snp.height).multipliedBy(0.5)
            iv.width.equalTo(self.snp.width)
            iv.centerX.equalTo(self.snp.centerX)
            
        }
    }
    
    private func setUpTextView() {
        postComment.snp.makeConstraints { tv in
            tv.top.equalTo(postImage.snp.bottom).offset(5)
            tv.width.equalTo(postImage.snp.width)
            tv.height.equalTo(postImage.snp.height)
            tv.centerX.equalTo(self.snp.centerX)
        }
    }
    
}
