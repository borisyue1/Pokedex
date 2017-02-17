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
        if segmentedControl.selectedSegmentIndex == 0 {
            setUpTableView()
        }
//        let customFont = UIFont(name: "Pokemon GB", size: 15.0)  //don't forget to put real font name here - otherwise it won't work or may cause crash (see NOTES) !!!
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: customFont!, NSForegroundColorAttributeName: UIColor.white], for: .normal)
    }
    
    func setUpTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY - UIApplication.shared.statusBarFrame.height, width: view.frame.width, height: view.frame.height))
        tableView.register(PokemonListTableViewCell.self, forCellReuseIdentifier: "pokemonCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        view.addSubview(tableView)
    }
    
    func setUpSegmentedControl() {
        segmentedControl = UISegmentedControl(items: ["List", "Grid"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = UIColor.white
        navigationItem.titleView = segmentedControl
    }

}

extension PokemonListViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
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
        pokeCell.name.text = currentPokemon.name.replacingOccurrences(of: "  ", with: " ") // make it a bit neater
        pokeCell.name.sizeToFit()
        pokeCell.name.frame.origin.y = tableView.rowHeight / 2 - pokeCell.name.frame.height / 2
        pokeCell.name.frame.origin.x = pokeCell.pokeImage.frame.maxX + 5
        pokeCell.pokeNum.text = "#\(currentPokemon.number!)"
        pokeCell.pokeNum.sizeToFit()
        pokeCell.pokeNum.frame.origin.y = tableView.rowHeight / 2 - pokeCell.pokeNum.frame.height / 2
        pokeCell.pokeNum.frame.origin.x = view.frame.width - pokeCell.pokeNum.frame.width - 15
        return pokeCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    
}
