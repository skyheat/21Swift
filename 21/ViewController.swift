//
//  ViewController.swift
//  Simple Swift 21
//
//  Created by Jun Han Yap on 27/10/2016.
//  Copyright © 2016 Jun Han Yap. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    let cardView = UIView()
    let dealerCardView = UIView()
    let label = UILabel()
    let WLlabel = UILabel()
    let dealerLabel = UILabel()
    let myView = UIView()
    var value:Int = 0
    var dealerValue:Int = 0
    let button = UIButton(type: UIButtonType.system)
    var img1 = UIImageView()
    var img2 = UIImageView()
    var img3 = UIImageView()
    var img4 = UIImageView()
    var img5 = UIImageView()
    var Dimg1 = UIImageView()
    var Dimg2 = UIImageView()
    var Dimg3 = UIImageView()
    var Dimg4 = UIImageView()
    var Dimg5 = UIImageView()
    var deck = ["Hearts01","Hearts02","Hearts03","Hearts04","Hearts05","Hearts06","Hearts07","Hearts08","Hearts09","Hearts10","Hearts11","Hearts12","Hearts13","Diamonds01","Diamonds02","Diamonds03","Diamonds04","Diamonds05","Diamonds06","Diamonds07","Diamonds08","Diamonds09","Diamonds10","Diamonds11","Diamonds12","Diamonds13","Spades01","Spades02","Spades03","Spades04","Spades05","Spades06","Spades07","Spades08","Spades09","Spades10","Spades11","Spades12","Spades13","Clubs01","Clubs02","Clubs03","Clubs04","Clubs05","Clubs06","Clubs07","Clubs08","Clubs09","Clubs10","Clubs11","Clubs12","Clubs13"]
    var shuffledDeck = ""
    var playerCardsAmount:Int = 0
    var playerCards = [Int]()
    var dealerCardsAmount:Int = 0
    var dealerCards = [Int]()
    let blank = "blank.png"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        // Do any additional setup after loading the view, typically from a nib.
        createView()
        createDealerView()
        createViewBottom()
        createLabel()
        createDealerLabel()
        createWLLabel()
        createButton()
        createStandButton()
        createStartGameButton()
        createRenewButton()
        createImgHolders()
        createDealerImgHolders()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startGame(_: UIButton)    {
        dealCards()
    }
    
    func createLabel()  {
        label.frame = CGRect(x: 620,y: 450,width: 300,height: 50)
        label.textColor = UIColor.white
        label.text = "Player Value: "
        label.font = UIFont(name: "DamascusBold", size: 25)
        
        self.view.addSubview(label)
    }
    func createWLLabel()  {
        WLlabel.frame = CGRect(x: self.view.center.x - 250,y: 350,width: 1000,height: 200)
        WLlabel.textColor = UIColor.white
        //create outline and box around the winning text.
        WLlabel.text = ""
        WLlabel.font = UIFont(name: "DamascusBold", size: 100)
        
        self.view.addSubview(WLlabel)
    }
    
    func createDealerLabel()  {
        dealerLabel.frame = CGRect(x: 620,y: 410,width: 300,height: 50)
        dealerLabel.textColor = UIColor.white
        dealerLabel.text = "Dealer Value: "
        dealerLabel.font = UIFont(name: "DamascusBold", size: 25)
        
        self.view.addSubview(dealerLabel)
    }

    func createView()   {
        cardView.frame = CGRect(x: 70,y: 500,width: 1175,height: 290)
        cardView.backgroundColor=UIColor.red
        cardView.layer.cornerRadius=25
        cardView.layer.borderWidth=0
        self.view.addSubview(cardView)
    }
    func createDealerView()   {
        dealerCardView.frame = CGRect(x: 70,y: 100,width: 1175,height: 290)
        dealerCardView.backgroundColor=UIColor.red
        dealerCardView.layer.cornerRadius=25
        dealerCardView.layer.borderWidth=0
        self.view.addSubview(dealerCardView)
    }
    
    func createImgHolders() {
        img1.frame = CGRect(x: 30,y: 10,width: 192,height: 270)
        img2.frame = CGRect(x: 250,y: 10,width: 192,height: 270)
        img3.frame = CGRect(x: 480,y: 10,width: 192,height: 270)
        img4.frame = CGRect(x: 710,y: 10,width: 192,height: 270)
        img5.frame = CGRect(x: 940,y: 10,width: 192,height: 270)
        
        cardView.addSubview(img1)
        cardView.addSubview(img2)
        cardView.addSubview(img3)
        cardView.addSubview(img4)
        cardView.addSubview(img5)
    }
    
    func createDealerImgHolders() {
        Dimg1.frame = CGRect(x: 30,y: 10,width: 192,height: 270)
        Dimg2.frame = CGRect(x: 250,y: 10,width: 192,height: 270)
        Dimg3.frame = CGRect(x: 480,y: 10,width: 192,height: 270)
        Dimg4.frame = CGRect(x: 710,y: 10,width: 192,height: 270)
        Dimg5.frame = CGRect(x: 940,y: 10,width: 192,height: 270)
        
        dealerCardView.addSubview(Dimg1)
        dealerCardView.addSubview(Dimg2)
        dealerCardView.addSubview(Dimg3)
        dealerCardView.addSubview(Dimg4)
        dealerCardView.addSubview(Dimg5)
    }
    
    func createViewBottom()   {
        myView.frame = CGRect(x: 0,y: 800,width: 1500,height: 300)
        myView.backgroundColor=UIColor.brown
        myView.layer.cornerRadius=0
        myView.layer.borderWidth=0
        self.view.addSubview(myView)
    }

    
    func createButton(){
        let button = UIButton(type: UIButtonType.system)
        button.frame = CGRect(x: 550,y: 900,width: 100,height: 50)
        button.backgroundColor = UIColor.green
        button.setTitle("Hit", for: UIControlState())
        button.addTarget(self, action:#selector(playerHit(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }
    
    
    func createStartGameButton()    {
        let button = UIButton(type: UIButtonType.system)
        button.frame = CGRect(x: 375,y: 900,width: 100,height: 50)
        button.backgroundColor = UIColor.green
        button.setTitle("Start", for: UIControlState())
        button.addTarget(self, action:#selector(startGame(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
    }
    func createStandButton()    {
        let button = UIButton(type: UIButtonType.system)
        button.frame = CGRect(x: 725,y: 900,width: 100,height: 50)
        button.backgroundColor = UIColor.green
        button.setTitle("Stand", for: UIControlState())
        button.addTarget(self, action:#selector(playerStand(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
    }
    func createRenewButton()    {
        let button = UIButton(type: UIButtonType.system)
        button.frame = CGRect(x: 900,y: 900,width: 100,height: 50)
        button.backgroundColor = UIColor.green
        button.setTitle("New Game", for: UIControlState())
        button.addTarget(self, action:#selector(reNew(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
    }
    
    func dealerTurn()   {
        dealerCardsAmount = 2
        while dealerCardsAmount < 5 {
            dealerHit()
            dealerCardsAmount = dealerCardsAmount + 1
            
            print("dealerCardsAmount")
            print(dealerCardsAmount)
        }
    }
        
    func playerStand(_: UIButton) {
        print("dealer turn")
        dealerTurn()
    }
    
    func statusChecker()    {
        if value > 21   {
            dealerVictory()
        }
        else if value == 21 {
            playerVictory()
            
        }
        else    {
            print("Player Decision")
        }
    }
    
    func statusCheckerDealer()    {
        if dealerValue > 21   {
            playerVictory()
        }
        else if dealerValue == 21 {
            dealerVictory()
            
        }
        else if dealerValue == value  {
            draw()
        }
        else    {
            winnerCompare()
        }
    }
    
    func draw() {
        print("Draw!")
        WLlabel.text = "Draw!"
    }
    func winnerCompare()    {
        if value > dealerValue  {
            print("Player Victory")
            WLlabel.text = "Player Wins!"
        }
        else if value < dealerValue   {
            print("Dealer Victory")
            WLlabel.text = "Dealer Wins!"

        }
        else if value == dealerValue   {
            print("Tie")
            WLlabel.text = "Tie!"

        }
    }
    
    func playerVictory()    {
        print("Player Wins! PlayerVictory()")
        WLlabel.text = "Player Wins!"


    }
    
    func dealerVictory()    {
        print("Dealer Wins! dealerVictory()")
        WLlabel.text = "Dealer Wins!"

    }
    func drawRandomCard() -> (suit:String, card:Int, cardValue:Int) {
        let suits = ["Diamonds", "Hearts", "Spades", "Clubs"]
        
        let suit = String(suits[Int(arc4random_uniform(3))])
        print(suit)
        let card = Int(arc4random_uniform(13)+1)
        var cardValue:Int = card
        
        deck.remove(at: card)
        print("playerCardsAmount")
        print(playerCardsAmount)
        
        print("Count")
        print(deck.count)
        
        //Adjustment of cards > 11
        if cardValue > 11 && cardValue < 13    {
            cardValue = cardValue - 1
        }
        else if cardValue > 11 && cardValue < 14{
            cardValue = cardValue - 2
        }
        
        else    {
            cardValue = card
        }
        
        _ = [suit, card]
        print(playerCards)
        
        return (suit!, card, cardValue)
    }
    
    func drawRandomCardDealer() -> (suit:String, cardDealer:Int, cardValueDealer:Int) {
        let suits = ["Diamonds", "Hearts", "Spades", "Clubs"]
        
        let suit = String(suits[Int(arc4random_uniform(3))])
        print(suit)
        let cardDealer = Int(arc4random_uniform(13)+1)
        var cardValueDealer:Int = cardDealer
        deck.remove(at: cardDealer)
        print("dealerCardsAmount")
        print(dealerCardsAmount)
        
        print("Count")
        print(deck.count)
        print(cardDealer)
        
        //Adjustment of cards > 11
        if cardDealer > 11 && cardDealer < 13    {
            cardValueDealer = cardDealer - 1
        }
        else if cardDealer > 11 && cardDealer < 14{
            cardValueDealer = cardDealer - 2
        }

        let dealerHand = [suit, cardDealer] as [Any]
        print(dealerHand)

        
        return (suit!, cardDealer, cardValueDealer)
        
    }
    
    func dealerHit() {
        let dealerCard3 = drawRandomCardDealer()
        let dealerCard4 = drawRandomCardDealer()
        let dealerCard5 = drawRandomCardDealer()
        
        print("dealer card amount")
        print(dealerCardsAmount)
        print("dealer Value")
        print(dealerValue)
        if dealerCardsAmount == 2 && dealerValue < 18 {
            self.Dimg3.image = UIImage(named: String(dealerCard3.suit) + String(dealerCard3.cardDealer))
            dealerCards.append(dealerCard3.cardDealer)
            print(dealerCards)
            dealerValue = dealerCards.reduce(0, +)
            dealerLabel.text = "Value: " + String(dealerValue)
            print("value")
            print(dealerValue)
            
        }
        else if dealerCardsAmount == 3 && dealerValue < 18  {
            self.Dimg4.image = UIImage(named: String(dealerCard4.suit) + String(dealerCard4.cardDealer))

            dealerCards.append(dealerCard4.cardDealer)
            
            print(dealerCards)
            dealerValue = dealerCards.reduce(0, +)
            dealerLabel.text = "Value: " + String(dealerValue
            )
            print("value")
            print(dealerValue)
            
            
        }
        else if dealerCardsAmount == 4 && dealerValue < 18   {
            self.Dimg5.image = UIImage(named: String(dealerCard5.suit) + String(dealerCard5.cardDealer))
            dealerCards.append(dealerCard5.cardDealer)
            print(dealerCards)
            dealerValue = playerCards.reduce(0, +)
            dealerLabel.text = "Value: " + String(dealerValue)
            print("value")
            print(dealerValue)
        
        }
            
        else if dealerCardsAmount == 5 && dealerValue <= 21  {
            dealerVictory()
        }
        
        else if dealerCardsAmount == 2 && dealerValue > 17  {
            statusCheckerDealer()
        }
        
        else if dealerCardsAmount == 3 && dealerValue > 17  {
            statusCheckerDealer()

        }
        else if dealerCardsAmount == 4 && dealerValue > 17   {
            statusCheckerDealer()

        }
        
    }
    
    func dealCards()    {
        let card1 = drawRandomCard()
        let card2 = drawRandomCard()
        let dealerCard1 = drawRandomCardDealer()
        let dealerCard2 = drawRandomCardDealer()
        
        playerCards.append(card1.cardValue)
        playerCards.append(card2.cardValue)
        dealerCards.append(dealerCard1.cardValueDealer)
        dealerCards.append(dealerCard2.cardValueDealer
        )
        value = card1.cardValue + card2.cardValue
        dealerValue = dealerCard2.cardValueDealer + dealerCard1.cardValueDealer
        label.text = "Value: " + String(value)
        dealerLabel.text = "Value: " + String(dealerValue)
        
        if value > 21   {
            dealerVictory()
        }
        else if dealerValue > 21    {
            playerVictory()
        }
        else if value == 21 {
            playerVictory()
        }
        else if dealerValue == 21   {
            dealerVictory()
        }

        print(value)
        print(playerCards)
        playerCardsAmount = 2
        print(playerCardsAmount)
        self.img2.image = UIImage(named: String(card2.suit) + String(card2.card))
        self.img1.image = UIImage(named: String(card1.suit) + String(card1.card))
        self.Dimg2.image = UIImage(named: String(dealerCard2.suit) + String(dealerCard2.cardDealer))
        self.Dimg1.image = UIImage(named: String(dealerCard1.suit) + String(dealerCard1.cardDealer))
    }
    func reNew(_: UIButton)    {
        UIApplication.shared.keyWindow?.rootViewController = storyboard!.instantiateInitialViewController()
    }
    func playerHit(_: UIButton) {
        let card3 = drawRandomCard()
        let card4 = drawRandomCard()
        let card5 = drawRandomCard()
        
        print("player card amount")
        print(playerCardsAmount)
        if playerCardsAmount == 2   {
            self.img3.image = UIImage(named: String(card3.suit) + String(card3.card))
            playerCardsAmount = playerCardsAmount + 1
            playerCards.append(card3.cardValue)
            print(playerCards)
            value = playerCards.reduce(0, +)
            label.text = "Value: " + String(value)
            print("value")
            print(value)
            statusChecker()

        }
        else if playerCardsAmount == 3  {
            self.img4.image = UIImage(named: String(card4.suit) + String(card4.card))
            playerCardsAmount = playerCardsAmount + 1
            playerCards.append(card4.cardValue)
            print(playerCards)
            value = playerCards.reduce(0, +)
            label.text = "Value: " + String(value)
            print("value")
            print(value)
            statusChecker()


        }
        else    {
            
            playerCardsAmount = playerCardsAmount + 1
            self.img5.image = UIImage(named: String(card5.suit) + String(card5.card))
            playerCards.append(card5.cardValue)
            print(playerCards)
            value = playerCards.reduce(0, +)
            label.text = "Value: " + String(value)
            print("value")
            print(value)
            statusChecker()


        }
        
        if playerCardsAmount == 5 && value <= 21    {
            playerVictory()
        }

    }


        
}
    
    
