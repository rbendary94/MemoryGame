//
//  ViewController.swift
//  MemoryGame
//
//  Created by Rana on 4/16/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cards: [UIButton]!
    @IBOutlet var currentButton :UIButton!
    var images :[UIImage]=[#imageLiteral(resourceName: "camarro") , #imageLiteral(resourceName: "ferari"), #imageLiteral(resourceName: "ferrari-california"), #imageLiteral(resourceName: "musta"),#imageLiteral(resourceName: "dodge"), #imageLiteral(resourceName: "images3"), #imageLiteral(resourceName: "images4"),#imageLiteral(resourceName: "hh"), #imageLiteral(resourceName: "camarro") , #imageLiteral(resourceName: "ferari"), #imageLiteral(resourceName: "ferrari-california"), #imageLiteral(resourceName: "musta"),#imageLiteral(resourceName: "dodge"), #imageLiteral(resourceName: "images3"), #imageLiteral(resourceName: "images4"),#imageLiteral(resourceName: "hh")]
    var firstClick = true
    var firstIndex :Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onClickFlip(_ sender: Any){
        
        currentButton = sender as! UIButton
        let index = cards.index(of: currentButton)!
        
        UIView.transition(with: self.cards[index], duration: 1, options: .transitionFlipFromRight, animations: {
            (self.cards[index]).setImage(self.images[index], for: .normal)
        }, completion: nil)

        if firstClick {
            firstIndex = index
            firstClick = false
        }else{
            self.firstClick = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

            if(self.images[self.firstIndex] == self.images[index]){
                
                //disable both btns
                self.cards[index].isEnabled = false
                self.cards[self.firstIndex].isEnabled = false
                
            }else{
                    //flip back
                    self.cards[self.firstIndex].setImage(#imageLiteral(resourceName: "card"), for: .normal)
                    self.cards[index].setImage(#imageLiteral(resourceName: "card"), for: .normal)
                
                    UIView.transition(with: self.cards[index], duration: 1, options: .transitionFlipFromRight, animations: {
                        (self.cards[index]).setImage(#imageLiteral(resourceName: "card"), for: .normal)
                    }, completion: nil)
                    
                    UIView.transition(with: self.cards[self.firstIndex], duration: 1, options: .transitionFlipFromRight, animations: {
                        (self.cards[self.firstIndex] ).setImage(#imageLiteral(resourceName: "card"), for: .normal)
                    }, completion: nil)
                
                
                }
            }
        }
        

        
        
      

    }
    
 

}

