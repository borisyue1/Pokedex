//
//  PokemonListViewController.swift
//  
//
//  Created by Boris Yue on 2/16/17.
//
//

import UIKit

class PokemonListViewController: UIViewController {

    var pokemons: [Pokemon]!
    var tableView: UITableView!
    var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSegmentedControl()
        setUpTableView()
        changeNavBarText()
    }
    
    func changeNavBarText() {
//        let customFont = UIFont(name: "Pokemon GB", size: 15.0)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
    }
    
    func setUpTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.minY, width: view.frame.width, height: view.frame.height))
        tableView.register(PokemonListTableViewCell.self, forCellReuseIdentifier: "pokemonCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        view.addSubview(tableView)
    }
    
    func setUpCollectionView() {
        
    }
    
    func setUpSegmentedControl() {
        segmentedControl = UISegmentedControl(items: ["List", "Grid"])
        segmentedControl.setWidth(70, forSegmentAt: 0)
        segmentedControl.setWidth(70, forSegmentAt: 1) //increase width of segmented control
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = UIColor.white
        segmentedControl.addTarget(self, action: #selector(changeView), for: .valueChanged)
        navigationItem.titleView = segmentedControl
    }
    
    func changeView() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            setUpTableView()
        case 1:
            setUpCollectionView()
        default:
            print("default")
        }
    }

}

extension PokemonListViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    // Setting up cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokeCell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell") as! PokemonListTableViewCell
        for subview in pokeCell.contentView.subviews {
            subview.removeFromSuperview() //remove stuff from cell before initializing
        }
        pokeCell.awakeFromNib() //initialize cell
        let currentPokemon = pokemons[indexPath.row]
        // retrieving images
        let url = URL(string: currentPokemon.imageUrl)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                if let dataRetrieved = data {
                    pokeCell.pokeImage.image = UIImage(data: dataRetrieved)
                } else {
                    pokeCell.pokeImage.image = #imageLiteral(resourceName: "question-mark")
                }
            }
        }
        //setting up text
        pokeCell.name.text = currentPokemon.name.replacingOccurrences(of: "  ", with: " ") // make it a bit neater, get rid of double spaces
        pokeCell.name.sizeToFit()
        pokeCell.name.frame.origin.y = tableView.rowHeight / 2 - pokeCell.name.frame.height / 2
        pokeCell.name.frame.origin.x = pokeCell.pokeImage.frame.maxX + 10
        if currentPokemon.number < 10 {
            pokeCell.pokeNum.text = "#00\(currentPokemon.number!)"
        } else if currentPokemon.number < 100 {
            pokeCell.pokeNum.text = "#0\(currentPokemon.number!)"
        } else {
            pokeCell.pokeNum.text = "#\(currentPokemon.number!)"
        }
        pokeCell.pokeNum.sizeToFit()
        pokeCell.pokeNum.frame.origin.y = tableView.rowHeight / 2 - pokeCell.pokeNum.frame.height / 2
        pokeCell.pokeNum.frame.origin.x = view.frame.width - pokeCell.pokeNum.frame.width - 15
        return pokeCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //CELL IS SELECTED, DISPLAY INDIVIDUAL POKEMON
        performSegue(withIdentifier: "toProfile", sender: nil)
    }
    
    
}
