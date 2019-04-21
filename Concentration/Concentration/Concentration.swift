//
//  Concentration.swift
//  Concentration
//
//  Created by Roma on 4/19/19.
//  Copyright © 2019 Roma. All rights reserved.
//

import Foundation

class Consentration{
    private(set) var cards = [Card]()
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex:Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for inddex in cards.indices {
                cards[inddex].isFaceUp = (inddex == newValue)
            }
        }
    }
    
    func chooseCard(at index:Int){
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        assert(cards.indices.contains(index)," Consetntration.chooseCard(at: \(index)): choosen index is not in the cards")
        if !cards[index].isMatched{
            if let mathedIndex = indexOfOneAndOnlyFaceUpCard, mathedIndex != index{
                // check if cards is match
                if cards[mathedIndex].identifier == cards[index].identifier {
                    cards[mathedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                // indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no ards or 2 cards are face up
//                for flipDownIndex in cards.indices {
//                    cards[flipDownIndex].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numbersOPairOfCard:Int) {
        assert(numbersOPairOfCard > 0 ," Consetntration.chooseCard(at: \(index)): you must have more then 0 cards")
        for _ in 0..<numbersOPairOfCard {
            let card = Card()
            // cards.append(card)
            // cards.append(card)
            cards += [card,card]
        }
        // TODO: Shuffle the cards
        cards.shuffle()
        //cards.shuffle()
        
        print(cards)
    }
}
