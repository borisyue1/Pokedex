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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
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

}

extension PokemonListViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell") as! PokemonListTableViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview() //remove stuff from cell before initializing
        }
        cell.awakeFromNib() //initialize cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let pokeCell = cell as! PokemonListTableViewCell
        pokeCell.name.text = pokemons[indexPath.row].name
        pokeCell.name.sizeToFit()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    
}
