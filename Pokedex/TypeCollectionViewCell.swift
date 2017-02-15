//
//  TypeCollectionViewCell.swift
//  Pokedex
//
//  Created by Boris Yue on 2/15/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class TypeCollectionViewCell: UICollectionViewCell {
    
    
    var typeButton: UIButton!
    
    override func awakeFromNib() {
        typeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 25))
        typeButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        typeButton.layer.cornerRadius = 3
        typeButton.clipsToBounds = true
        contentView.addSubview(typeButton)
    }
}
