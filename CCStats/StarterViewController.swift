//
//  StarterViewController.swift
//  CCStats
//
//  Created by Graham Schilling on 12/27/15.
//  Copyright (c) 2015 Graham Schilling. All rights reserved.
//

import UIKit

class StarterViewController: UIViewController {

    @IBOutlet weak var AddPlayerButton: UIButton!
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var playerCount: UILabel!
    var playersCount = 0
    
    var currGame = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addPlayerButton(sender: AnyObject) {
        playersCount += 1
        playerCount.text = String(playersCount)
        var player = Player(name: playerName.text)
        if playersCount <= 6{
            currGame.homePlayerList.append(player)
        } else{
            currGame.awayPlayerList.append(player)
        }
        playerName.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "starterSegue" {
            print("right segue")
            if let destination = segue.destinationViewController as? FirstViewController{
                print("set someting")
                destination.game = currGame
            }
        }
    }

}
