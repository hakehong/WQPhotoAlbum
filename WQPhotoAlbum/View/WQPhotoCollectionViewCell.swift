//
//  WQPhotoCollectionViewCell.swift
//  WQPhotoAlbum
//
//  Created by 王前 on 16/12/1.
//  Copyright © 2016年 qian.com. All rights reserved.
//

import UIKit

class WQPhotoCollectionViewCell: UICollectionViewCell {
    lazy var selectButton: UIButton = {
        let button = UIButton()
        let contenViewSize = self.contentView.bounds.size
        button.frame = CGRect(x: contenViewSize.width * 2 / 3 - 2, y: 2, width: contenViewSize.width / 3, height: contenViewSize.width / 3)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: contenViewSize.width/3 - contenViewSize.width/4, bottom: contenViewSize.width/3 - contenViewSize.width/4, right: 0)
        button.setImage(UIImage.init(named: "album_select_gray.png"), for: .normal)
        button.setImage(UIImage.init(named: "album_select_blue.png"), for: .selected)
        button.addTarget(self, action: #selector(selelctButtonClick(button:)), for: .touchUpInside)
        return button
    }()
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = self.contentView.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor.cyan
        return imageView
    }()
    
    //  cell 是否被选择
    var isChoose = false {
        didSet {
            self.selectButton.isSelected = isChoose
        }
    }
    
    // 图片选中闭包
    var selectPhotoCompleted: ((Void) -> Void)?
    
    // 图片设置
    var photoImage: UIImage? {
        didSet {
            self.photoImageView.image = photoImage
        }
    }
    
    convenience init() {
        self.init(frame: CGRect.init())
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(self.photoImageView)
        self.contentView.addSubview(self.selectButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selelctButtonClick(button: UIButton) {
        self.isChoose = !self.isChoose
        if selectPhotoCompleted != nil {
            selectPhotoCompleted!()
        }
    }
}
