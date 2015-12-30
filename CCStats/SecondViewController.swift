//
//  SecondViewController.swift
//  CCStats
//
//  Created by Graham Schilling on 12/27/15.
//  Copyright (c) 2015 Graham Schilling. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var game: Game!
    @IBOutlet weak var shotsTaken: UILabel!
    @IBOutlet weak var shotsTakenAway: UILabel!
    @IBOutlet weak var homeProgress: UIProgressView!
    @IBOutlet weak var awayProgress: UIProgressView!
    @IBOutlet weak var awayPercFinished: UILabel!
    @IBOutlet weak var homePercFinished: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeShotsMade = homeShootingMade()
        let homeShotsTaken = game.homeShotsTaken
        let homePercent = String(stringInterpolationSegment: round(homeShotsMade/homeShotsTaken * 100))
        shotsTaken.text = "Shooting Percentage: \(homeShotsMade)/\(homeShotsTaken) = \(homePercent)%"
        let awayShotsMade = awayShootingMade()
        let awayShotsTaken = game.awayShotsTaken
        let awayPercent = String(stringInterpolationSegment: round(awayShotsMade/awayShotsTaken * 100))
        shotsTakenAway.text = "Shooting Percentage: \(awayShotsMade)/\(awayShotsTaken) = \(awayPercent)%"
        
        homeProgress.setProgress(Float(homeShotsMade/100.0), animated: true)
        awayProgress.setProgress(Float(awayShotsMade/100.0), animated: true)
        homePercFinished.text = "\(round(homeShotsMade))% Complete"
        awayPercFinished.text = "\(round(awayShotsMade))% Complete"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func homeShootingMade() -> Double{
        var homeShotsMade = 0.0
        for(var i=0; i<6; i++){
            homeShotsMade += Double(game.homePlayerList[i].shotsMade())
        }
        return homeShotsMade
    }
    
    func awayShootingMade() -> Double{
        var awayShotsMade = 0.0
        for(var i=0; i<6; i++){
            awayShotsMade += Double(game.awayPlayerList[i].shotsMade())
        }
        return awayShotsMade
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "backToGame" {
            print("back to game")
            if let destination = segue.destinationViewController as? FirstViewController{
                destination.game = game
            }
        }else if segue.identifier == "playerTableSegue" {
            print("going to table")
            let destinationNavigationController = segue.destinationViewController as! UINavigationController
            if let targetController = destinationNavigationController.topViewController as? PlayerTableViewController{
                targetController.game = game
            }
        }
    }


}

