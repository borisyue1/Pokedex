//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit
import ASHorizontalScrollView
class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var imageView2: UIImageView!
    
    var typeLabel: UILabel!
    
    var horizontalScrollView: ASHorizontalScrollView!
    
    var attributesLabel: UILabel!
    
    var attackPointsButton: RectButton!
    var attackPointsLabel: UILabel!
    
    var defensePointsButton: RectButton!
    var defensePointsLabel: UILabel!
    
    var healthPointsButton: RectButton!
    var healthPointsLabel: UILabel!
    
    var typeIconArray: [UIImageView] = []
    
    var typeNamesArray = ["bug.png", "dark.png", "dragon.png", "electric.png", "fairy.png", "fighting.png", "fire.png", "flying.png", "ghost.png", "grass.png", "ground.png", "ice.png", "normal.png", "poison.png", "psycic.png", "rock.png", "steel.png", "water.png"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initTypeLabelUI()
        initHorizontalScrollViewUI()
        initAttributesLabelUI()
        initAttackPointsButtonUI()
        initDefensePointsButtonUI()
        initHealthPointsButtonUI()
        
        view.addSubview(typeLabel)
        view.addSubview(horizontalScrollView)
        
        view.addSubview(attributesLabel)
        view.addSubview(attackPointsButton)
        view.addSubview(attackPointsLabel)
        
        view.addSubview(defensePointsButton)
        view.addSubview(defensePointsLabel)
        
        view.addSubview(healthPointsButton)
        view.addSubview(healthPointsLabel)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initTypeLabelUI() {
        typeLabel = UILabel(frame: CGRect(x: 15, y: (navigationController?.navigationBar.frame.maxY)!, width: view.frame.width, height: 50))
        typeLabel.text = "TYPE"
        typeLabel.font = UIFont(name: "PokemonGB", size: 16.0)
        typeLabel.setTextSpacing(spacing: 7.0)
    }
    
    func initHorizontalScrollViewUI() {
        horizontalScrollView = ASHorizontalScrollView(frame: CGRect(x: -1, y: typeLabel.frame.maxY, width: view.frame.width + 2, height: 80))
        horizontalScrollView.uniformItemSize = CGSize(width: 60, height: 60)
        horizontalScrollView.marginSettings_320 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 0, miniAppearWidthOfLastItem: 0)
        horizontalScrollView.marginSettings_375 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 0, miniAppearWidthOfLastItem: 0)
        horizontalScrollView.marginSettings_414 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 0, miniAppearWidthOfLastItem: 0)
        horizontalScrollView.marginSettings_480 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 0, miniAppearWidthOfLastItem: 0)
        horizontalScrollView.marginSettings_568 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 0, miniAppearWidthOfLastItem: 0)
        horizontalScrollView.marginSettings_667 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 0, miniAppearWidthOfLastItem: 0)
        horizontalScrollView.marginSettings_736 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 0, miniAppearWidthOfLastItem: 0)
        horizontalScrollView.marginSettings_768 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 0, miniAppearWidthOfLastItem: 0)
        horizontalScrollView.marginSettings_1024 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 0, miniAppearWidthOfLastItem: 0)
        horizontalScrollView.marginSettings_1366 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 0, miniAppearWidthOfLastItem: 0)
        
        horizontalScrollView.backgroundColor = UIColor.init(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        horizontalScrollView.layer.borderWidth = 1
        horizontalScrollView.layer.borderColor = UIColor.init(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0).cgColor
        addImagesToTypesView()
    }
    
    func addImagesToTypesView() {
        for i in 0...17 {
            typeIconArray.append(UIImageView(image: UIImage(named: typeNamesArray[i])))
            typeIconArray[i].clipsToBounds = true
            typeIconArray[i].contentMode = UIViewContentMode.scaleAspectFit
            typeIconArray[i].frame = CGRect(x: 0, y: 0, width: 60, height: 60)
            horizontalScrollView.addItem(typeIconArray[i])
        }
    }
    
    func initAttributesLabelUI() {
        attributesLabel = UILabel(frame: CGRect(x: 15, y: horizontalScrollView.frame.maxY + 5, width: view.frame.width, height: 50))
        attributesLabel.text = "ATTRIBUTES"
        attributesLabel.font = UIFont(name: "PokemonGB", size: 16.0)
        attributesLabel.setTextSpacing(spacing: 7.0)
        
    }
    
    func initAttackPointsButtonUI() {
        attackPointsButton = RectButton(frame: CGRect(x:0, y:attributesLabel.frame.maxY + 10, width: view.frame.width, height: 50))
        attackPointsButton.setTitle("Attack Points", for: .normal)
        attackPointsButton.titleLabel?.font = UIFont(name: "PokemonGB", size:12.0)
        attackPointsButton.titleLabel?.setTextSpacing(spacing: 0.7)
        attackPointsButton.backgroundColor = UIColor.init(red: 200/255, green: 100/255, blue: 100/255, alpha: 1.0)
        
        let button_width = -(attackPointsButton.frame.width) / 2
        let label_width = (attackPointsButton.titleLabel?.intrinsicContentSize.width)! / 2 //width of the text
        
        attackPointsButton.titleEdgeInsets = UIEdgeInsets(top: 0,left: button_width + label_width + 25, bottom: 0,right: (attackPointsButton.frame.width) / 2 - label_width)
        
        attackPointsLabel = UILabel(frame: CGRect(x: 0, y: attackPointsButton.frame.minY + (attackPointsButton.frame.height / 2) - 10, width: view.frame.width, height: 20))
        attackPointsLabel.text = "0-1000"
        attackPointsLabel.font = UIFont(name: "PokemonGB", size: 16.0)
        attackPointsLabel.setTextSpacing(spacing: 0.7)
        attackPointsLabel.textColor = UIColor.white
        
        attackPointsLabel.frame = CGRect(x: view.frame.width - (attackPointsLabel.intrinsicContentSize.width) - 15, y: attackPointsButton.frame.minY + (attackPointsButton.frame.height / 2) - 10, width: attackPointsLabel.intrinsicContentSize.width, height: 20)
    }
    
    func initDefensePointsButtonUI() {
        defensePointsButton = RectButton(frame: CGRect(x:0, y:attackPointsButton.frame.maxY, width: view.frame.width, height: 50))
        defensePointsButton.setTitle("Defense Points", for: .normal)
        defensePointsButton.titleLabel?.font = UIFont(name: "PokemonGB", size:12.0)
        defensePointsButton.titleLabel?.setTextSpacing(spacing: 0.7)
        defensePointsButton.backgroundColor = UIColor.init(red: 140/255, green: 140/255, blue: 230/255, alpha: 1.0)
        
        let button_width = -(defensePointsButton.frame.width) / 2
        let label_width = (defensePointsButton.titleLabel?.intrinsicContentSize.width)! / 2
        
        defensePointsButton.titleEdgeInsets = UIEdgeInsets(top: 0,left: button_width + label_width + 25, bottom: 0,right: (defensePointsButton.frame.width) / 2 - label_width)
        
        defensePointsLabel = UILabel(frame: CGRect(x: 0, y: defensePointsButton.frame.minY + (defensePointsButton.frame.height / 2) - 10, width: view.frame.width, height: 20))
        defensePointsLabel.text = "0-1000"
        defensePointsLabel.font = UIFont(name: "PokemonGB", size: 16.0)
        defensePointsLabel.setTextSpacing(spacing: 0.7)
        defensePointsLabel.textColor = UIColor.white
        
        defensePointsLabel.frame = CGRect(x: view.frame.width - (defensePointsLabel.intrinsicContentSize.width) - 15, y: defensePointsButton.frame.minY + (defensePointsButton.frame.height / 2) - 10, width: defensePointsLabel.intrinsicContentSize.width, height: 20)
    }
    
    func initHealthPointsButtonUI() {
        healthPointsButton = RectButton(frame: CGRect(x:0, y:defensePointsButton.frame.maxY, width: view.frame.width, height: 50))
        healthPointsButton.setTitle("Health Points", for: .normal)
        healthPointsButton.titleLabel?.font = UIFont(name: "PokemonGB", size:12.0)
        healthPointsButton.titleLabel?.setTextSpacing(spacing: 0.7)
        healthPointsButton.backgroundColor = UIColor.init(red: 140/255, green: 230/255, blue: 140/255, alpha: 1.0)
        
        let button_width = -(healthPointsButton.frame.width) / 2
        let label_width = (healthPointsButton.titleLabel?.intrinsicContentSize.width)! / 2
        
        healthPointsButton.titleEdgeInsets = UIEdgeInsets(top: 0,left: button_width + label_width + 25, bottom: 0,right: (healthPointsButton.frame.width) / 2 - label_width)
        
        healthPointsLabel = UILabel(frame: CGRect(x: 0, y: healthPointsButton.frame.minY + (healthPointsButton.frame.height / 2) - 10, width: view.frame.width, height: 20))
        healthPointsLabel.text = "0-1000"
        healthPointsLabel.font = UIFont(name: "PokemonGB", size: 16.0)
        healthPointsLabel.setTextSpacing(spacing: 0.7)
        healthPointsLabel.textColor = UIColor.white
        
        healthPointsLabel.frame = CGRect(x: view.frame.width - (healthPointsLabel.intrinsicContentSize.width) - 15, y: healthPointsButton.frame.minY + (healthPointsButton.frame.height / 2) - 10, width: healthPointsLabel.intrinsicContentSize.width, height: 20)
    }
}
extension UILabel{
    func setTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: text!)
        if textAlignment == .center || textAlignment == .right {
            attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: attributedString.length-1))
        } else {
            attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: attributedString.length))
        }
        attributedText = attributedString
    }
}
