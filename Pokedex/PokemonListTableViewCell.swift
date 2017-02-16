//
//  PokemonListTableViewCell.swift
//  Pokedex
//
//  Created by Boris Yue on 2/16/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {

    var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        name = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        name.textColor = UIColor.black
        contentView.addSubview(name)
    }

}
