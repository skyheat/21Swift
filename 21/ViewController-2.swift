//
//  ViewController.swift
//  21
//
//  Created by Jun Han Yap on 27/10/2016.
//  Copyright © 2016 Jun Han Yap. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    let cardView = UIView()
    let label = UILabel()
    let myView = UIView()
    var value:Int = 0
    let button = UIButton(type: UIButtonType.System)
    var img1 = UIImageView()
    var img2 = UIImageView()
    var img3 = UIImageView()
    var img4 = UIImageView()
    var img5 = UIImageView()
    var deck = ["Hearts01","Hearts02","Hearts03","Hearts04","Hearts05","Hearts06","Hearts07","Hearts08","Hearts09","Hearts10","Hearts11","Hearts12","Hearts13","Diamonds01","Diamonds02","Diamonds03","Diamonds04","Diamonds05","Diamonds06","Diamonds07","Diamonds08","Diamonds09","Diamonds10","Diamonds11","Diamonds12","Diamonds13","Spades01","Spades02","Spades03","Spades04","Spades05","Spades06","Spades07","Spades08","Spades09","Spades10","Spades11","Spades12","Spades13","Clubs01","Clubs02","Clubs03","Clubs04","Clubs05","Clubs06","Clubs07","Clubs08","Clubs09","Clubs10","Clubs11","Clubs12","Clubs13"]
    var shuffledDeck = ""
    var playerCardsAmount:Int = 0
    var playerCards = [Int]()
    var playerValue:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        // Do any additional setup after loading the view, typically from a nib.
        createView()
        createViewBottom()
        createLabel()
        createButton()
        createStandButton()
        createImgHolders()
        dealCards()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createLabel()  {
        label.frame = CGRectMake(625,800,125,50)
        label.backgroundColor = UIColor.blackColor()
        label.textColor = UIColor.whiteColor()
        label.text = "Value: "
        label.font = UIFont(name: "DamascusBold", size: 25)
        
        self.view.addSubview(label)
    }

    func createView()   {
        cardView.frame = CGRectMake(70,500,1175,290)
        cardView.backgroundColor=UIColor.redColor()
        cardView.layer.cornerRadius=25
        cardView.layer.borderWidth=0
        self.view.addSubview(cardView)
    }
    
    func createImgHolders() {
        //let img1 = UIImageView()
        //let img2 = UIImageView()
        img1.frame = CGRectMake(30,10,192,270)
        img2.frame = CGRectMake(250,10,192,270)
        img3.frame = CGRectMake(480,10,192,270)
        img4.frame = CGRectMake(710,10,192,270)
        img5.frame = CGRectMake(940,10,192,270)
        
        //img1.image = UIImage(named: "card_back")
        //img2.image = UIImage(named: "card_back")
        
        cardView.addSubview(img1)
        cardView.addSubview(img2)
        cardView.addSubview(img3)
        cardView.addSubview(img4)
        cardView.addSubview(img5)
    }
    
    func createViewBottom()   {
        myView.frame = CGRectMake(0,800,1500,300)
        myView.backgroundColor=UIColor.darkGrayColor()
        myView.layer.cornerRadius=0
        myView.layer.borderWidth=0
        self.view.addSubview(myView)
    }

    
    func createButton(){
        let button = UIButton(type: UIButtonType.System)
        button.frame = CGRectMake(550,900,100,50)
        button.backgroundColor = UIColor.blackColor()
        button.setTitle("Hit", forState: UIControlState.Normal)
        button.addTarget(self, action:#selector(playerHit(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    func createStandButton()    {
        let button = UIButton(type: UIButtonType.System)
        button.frame = CGRectMake(725,900,100,50)
        button.backgroundColor = UIColor.blackColor()
        button.setTitle("Stand", forState: UIControlState.Normal)
        //button.addTarget(self, action:#selector(playerHit(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)

    }
    
    func playerStand()  {
        
    }
    
    func statusChecker()    {
        
    }
    
    func drawRandomCard() -> (suit:String, card:Int, cardValue:Int) {
        let suits = ["Diamonds", "Hearts", "Spades", "Clubs"]
        //var shuffledDeck = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(deck) as! [String]
        
        let suit = String(suits[Int(arc4random_uniform(3))])
        print(suit)
        var card = Int(arc4random_uniform(13)+1)
        var cardValue:Int = card
        
        var removeCard = deck.removeAtIndex(card)
        print("playerCardsAmount")
        print(playerCardsAmount)
        
        print("Count")
        print(deck.count)
        print(card)
        
        //Adjustment of cards > 11
        if card > 11 && card < 13    {
            cardValue = card - 1
        }
        else if card > 11 && card < 14{
            cardValue = card - 2
        }

        //print(suit, card)
        var playerHand = [suit, card]
        print(playerHand)
        
        //print(shuffledDeck)
        
        return (suit, card, cardValue)
        //var playerHand = [String]()
        //var newCard = shuffledDeck.removeFirst()
        //playerHand.append(newCard)
        //print(playerHand)
    }
    
    func dealCards()    {
        var card1 = drawRandomCard()
        var card2 = drawRandomCard()
        
        playerCards.append(card1.card)
        playerCards.append(card2.card)
        
        let sum = playerCards.reduce(0 combine: +)
        print(sum)
        label.text = "Value: " + sum
        print(playerCards)
        playerCardsAmount = 2
        print(playerCardsAmount)
        self.img2.image = UIImage(named: String(card2.suit) + String(card2.card))
        self.img1.image = UIImage(named: String(card1.suit) + String(card1.card))
        }
    
    func drawPlayerSecondCard() {
        var card4 = drawRandomCard()
        
        self.img4.image = UIImage(named: String(card4.suit) + String(card4.card))
    }
    func playerHit(_: UIButton) {
        var card3 = drawRandomCard()
        var card4 = drawRandomCard()
        var card5 = drawRandomCard()
        
        print("player card amount")
        print(playerCardsAmount)
        if playerCardsAmount == 2   {
            self.img3.image = UIImage(named: String(card3.suit) + String(card3.card))
            playerCardsAmount = playerCardsAmount + 1
            playerCards.append(card3.card)
            print(playerCards)
        }
        else if playerCardsAmount == 3  {
            self.img4.image = UIImage(named: String(card4.suit) + String(card4.card))
            playerCardsAmount = playerCardsAmount + 1
            playerCards.append(card4.card)
            print(playerCards)

        }
        else    {
            
            playerCardsAmount = playerCardsAmount + 1
            self.img5.image = UIImage(named: String(card5.suit) + String(card5.card))
            playerCards.append(card5.card)
            print(playerCards)
            
            //else if playerCardsValue <= 21 {
              //  print("Player Wins!")
            //}


        }

        //if playerCardsAmount == 3    {
           // drawPlayerSecondCard()
        //}

    }
    
        //display cards in image view
               // if card1.card < 10      {
                    //print("change image", String(card1.suit) + "0" + String(card1.card))
                    //self.img1.image = UIImage(named: String(card1.suit) + "0" + String(card1.card))
                //}
                //else if card1.card >= 10    {
                  //  print("change image", String(card1.suit) + String(card1.card))
                  //  self.img1.image = UIImage(named: String(card1.suit) + String(card1.card))
              //  }
        
               // if card2.card < 10     {
                 //   print("change image", String(card2.suit) + "0" + String(card2.card))
                  //  self.img2.image = UIImage(named: String(card2.suit) + "0" + String(card2.card))
               // }
               // else if card2.card >= 10    {
                 //   print("change image", String(card2.suit) + String(card2.card))
                 //   self.img2.image = UIImage(named: String(card2.suit) + String(card2.card))
               // }
               // let value = card1.card + card2.card
               // print(value)
              //  if value > 21   {
                //    print("You lose!")
              //  }
               // else{
                 //   print("you win!")
                //}
        
        
    }
    
    //func playerHitAgain()   {
        
   // }
