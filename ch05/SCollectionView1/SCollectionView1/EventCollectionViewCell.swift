//
//  EventCollectionViewCell.swift
//  SCollectionView1
//
//  Created by MyZiyue on 2018/12/26.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    var label:UILabel!
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        let cellWidth:CGFloat = self.frame.width
        let imageViewWidth:CGFloat = 101
        let imageViewHeight:CGFloat = 101
        let imageViewTopView:CGFloat = 15
        
        self.imageView = UIImageView(frame: CGRect(x:(cellWidth - imageViewWidth)/2, y:imageViewTopView, width: imageViewWidth, height:imageViewHeight))
        self.addSubview(self.imageView)
        
        let labelWidth:CGFloat = 101
        let labelHeight:CGFloat = 16
        let labelTopView:CGFloat = 120
        
        self.label = UILabel(frame: CGRect(x:(cellWidth - labelWidth)/2, y: labelTopView, width:labelWidth, height: labelHeight))
        self.label.textAlignment = .center
        self.label.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(self.label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
