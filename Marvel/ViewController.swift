//
//  ViewController.swift
//  Marvel
//
//  Created by Fehér Donát on 19.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pagingLabel: UILabel!
    
    @IBOutlet weak var heroNameLabel: UILabel!
    
    @IBOutlet weak var heroImageView: UIImageView!
    
    var heroes: [Hero] = [] //empty Hero types array 
    var current: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initHeroes()
    }
    
    func initHeroes() { //fill the heroes array with datas
        heroes.append(Hero("01", "Caption Marvel"))
        heroes.append(Hero("02", "Thanos"))
        heroes.append(Hero("03", "Black Phanter "))
        heroes.append(Hero("04", "Yon-Rogg"))
        heroes.append(Hero("05", "Spider Man"))
        heroes.append(Hero("06", "Goose the Cat"))
        heroes.append(Hero("07", "Iron Man"))
        heroes.append(Hero("08", "Captian America"))
        heroes.append(Hero("09", "Black Widow"))
        heroes.append(Hero("10", "Hulk"))
        heroes.append(Hero("11", "Hawkeye"))
        heroes.append(Hero("12", "Thor"))
    }
    
    func getNext() -> Hero { //paging
        current += 1
        if current >= heroes.count {
            current = 0
        }
        return heroes[current]
    }
    
    func getPrevious() -> Hero { //paging
        current -= 1
        if current < 0 {
            current = heroes.count - 1
        }
        return heroes[current]
    }
    
    func displayHero(_ hero: Hero) { //it changes the hero picture's
        heroNameLabel.text = hero.name //change the hero name
        pagingLabel.text = "\(current + 1)/\(heroes.count)" //set the pagingLabel text
        heroImageView.image = UIImage(named: hero.imgage) //this line changes the hero's image
    }
    
    @IBAction func previousOnTouch(_ sender: UIButton) {
        displayHero(getPrevious())

    }
    
    @IBAction func nextOnTouch(_ sender: UIButton) {
        displayHero(getNext())
    }
    
}

