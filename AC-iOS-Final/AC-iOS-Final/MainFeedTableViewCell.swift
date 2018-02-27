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
        iv.contentMode = UIViewContentMode.scaleAspectFit
//        iv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        iv.setContentHuggingPriority(UILayoutPriority(252), for: .vertical)
        return iv
    }()
    
    lazy var postComment: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.isSelectable = false
//        tv.adjustsFontForContentSizeCategory = true
        tv.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        tv.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
        
        return tv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: "MainFeedCell")
        setUpSubviews()
        self.backgroundColor = .white
//        heightAnchor.constraint(equalToConstant: 500).isActive = true
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
        views.forEach { self.contentView.addSubview($0) }
        setUpImageView()
        setUpTextView()
    }
    
    private func setUpImageView() {
        postImage.snp.makeConstraints { iv in
            iv.top.equalTo(contentView.snp.top)
            iv.width.equalTo(contentView.safeAreaLayoutGuide.snp.width)
            iv.height.equalTo(postImage.snp.width)
            iv.centerX.equalTo(contentView.snp.centerX)
        }
    }
    
    private func setUpTextView() {
        postComment.snp.makeConstraints { tv in
            tv.top.equalTo(postImage.snp.bottom)
            tv.width.equalTo(postImage.snp.width)
            tv.height.greaterThanOrEqualTo(postImage.snp.height).multipliedBy(0.3)
            tv.centerX.equalTo(contentView.snp.centerX)
            tv.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
        
    }
    
}
