//
//  ViewController.swift
//  Concentration
//
//  Created by Roma on 4/13/19.
//  Copyright © 2019 Roma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
    
    private lazy var game = Consentration(numbersOPairOfCard: numbersOPairOfCard)
    var numbersOPairOfCard :Int {
        get {
            return (cardButtons.count + 1) / 2
        }
    }
    
    private(set) var flipCount:Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        //flipCard(withEmoji: "👻", on: sender)
        if let cardNumber = cardButtons.index(of: sender){
            //print("cardNumber = \(cardNumber)")
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoices:[String] = ["👻","🎃","🦇","😱","🍎","🍭","🍬","😈","👹","🤡","😺","🤯","😤","😎"]
    
    private var emoji = [Int:String]()

    private func emoji(for card:Card) -> String {
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        if emoji[card.identifier]==nil , emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }

}

extension Int {
    var arc4random:Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
