//
//  RectButton.swift
//  Pokedex
//
//  Created by Boris Yue on 2/15/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit


class RectButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var frame = self.titleLabel?.frame;
        frame?.size.height = self.bounds.size.height;
        frame?.origin.y = self.titleEdgeInsets.top;
        self.titleLabel?.frame = frame!;
    }
    
}
