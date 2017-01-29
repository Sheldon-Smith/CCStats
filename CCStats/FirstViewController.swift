//
//  FirstViewController.swift
//  CCStats
//
//  Created by Graham Schilling on 12/27/15.
//  Copyright (c) 2015 Graham Schilling. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var game: Game!
    
    @IBOutlet weak var shooterName: UILabel!
    @IBOutlet weak var tenShotSummary: UILabel!
    @IBOutlet weak var currTeam: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if game.homeTeamUp{
            shooterName.text = game.homePlayerList[game.homeTeamOrder[0]].name
            tenShotSummary.text = "Available after 5 shots"
            currTeam.text = "Team 1"
        }else {
            shooterName.text = game.awayPlayerList[game.awayTeamOrder[0]].name
            tenShotSummary.text = "Available after 5 shots"
            currTeam.text = "Team 2"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func topMake(sender: AnyObject) {
        if game.homeTeamUp{
            let playerCount = game.homeTeamOrder.count
            game.homeShotsTaken += 1
            game.homePlayerList[game.homeTeamOrder[0]].topMakes += 1
            trackLastTen(game.homePlayerList[game.homeTeamOrder[0]], made: true)
            let orderIndex = game.homeTeamOrder.removeAtIndex(0)
            game.homeTeamOrder.append(orderIndex)
            shooterName.text = game.homePlayerList[game.homeTeamOrder[0]].name
            tenShotSummary.text = game.homePlayerList[game.homeTeamOrder[0]].lastTenSummary()
            checkForEndOfTurn(playerCount, teamOrder: game.homeTeamOrder)
        }else{
            let playerCount = game.awayTeamOrder.count
            game.awayShotsTaken += 1
            game.awayPlayerList[game.awayTeamOrder[0]].topMakes += 1
            trackLastTen(game.awayPlayerList[game.awayTeamOrder[0]], made: true)
            let orderIndex = game.awayTeamOrder.removeAtIndex(0)
            game.awayTeamOrder.append(orderIndex)
            shooterName.text = game.awayPlayerList[game.awayTeamOrder[0]].name
            tenShotSummary.text = game.awayPlayerList[game.awayTeamOrder[0]].lastTenSummary()
            checkForEndOfTurn(playerCount, teamOrder: game.awayTeamOrder)
        }
    }

    @IBAction func bottomMake(sender: AnyObject) {
        if game.homeTeamUp{
            let playerCount = game.homeTeamOrder.count
            game.homeShotsTaken += 1
            game.homePlayerList[game.homeTeamOrder[0]].bottomMakes += 1
            trackLastTen(game.homePlayerList[game.homeTeamOrder[0]], made: true)
            let orderIndex = game.homeTeamOrder.removeAtIndex(0)
            game.homeTeamOrder.append(orderIndex)
            shooterName.text = game.homePlayerList[game.homeTeamOrder[0]].name
            tenShotSummary.text = game.homePlayerList[game.homeTeamOrder[0]].lastTenSummary()
            checkForEndOfTurn(playerCount, teamOrder: game.homeTeamOrder)
        }else{
            let playerCount = game.awayTeamOrder.count
            game.awayShotsTaken += 1
            game.awayPlayerList[game.awayTeamOrder[0]].bottomMakes += 1
            trackLastTen(game.awayPlayerList[game.awayTeamOrder[0]], made: true)
            let orderIndex = game.awayTeamOrder.removeAtIndex(0)
            game.awayTeamOrder.append(orderIndex)
            shooterName.text = game.awayPlayerList[game.awayTeamOrder[0]].name
            tenShotSummary.text = game.awayPlayerList[game.awayTeamOrder[0]].lastTenSummary()
            checkForEndOfTurn(playerCount, teamOrder: game.awayTeamOrder)
        }
    }
    
    @IBAction func topGay(sender: AnyObject) {
        if game.homeTeamUp{
            let playerCount = game.homeTeamOrder.count
            game.homeShotsTaken += 1
            game.homePlayerList[game.homeTeamOrder[0]].topGays += 1
            trackLastTen(game.homePlayerList[game.homeTeamOrder[0]], made: true)
            let orderIndex = game.homeTeamOrder.removeAtIndex(0)
            game.homeTeamOrder.append(orderIndex)
            shooterName.text = game.homePlayerList[game.homeTeamOrder[0]].name
            tenShotSummary.text = game.homePlayerList[game.homeTeamOrder[0]].lastTenSummary()
            checkForEndOfTurn(playerCount, teamOrder: game.homeTeamOrder)
        }else{
            let playerCount = game.awayTeamOrder.count
            game.awayShotsTaken += 1
            game.awayPlayerList[game.awayTeamOrder[0]].topGays += 1
            trackLastTen(game.awayPlayerList[game.awayTeamOrder[0]], made: true)
            let orderIndex = game.awayTeamOrder.removeAtIndex(0)
            game.awayTeamOrder.append(orderIndex)
            shooterName.text = game.awayPlayerList[game.awayTeamOrder[0]].name
            tenShotSummary.text = game.awayPlayerList[game.awayTeamOrder[0]].lastTenSummary()
            checkForEndOfTurn(playerCount, teamOrder: game.awayTeamOrder)
        }
    }
    
    @IBAction func bottomGay(sender: AnyObject) {
        if game.homeTeamUp{
            let playerCount = game.homeTeamOrder.count
            game.homeShotsTaken += 1
            game.homePlayerList[game.homeTeamOrder[0]].bottomGays += 1
            trackLastTen(game.homePlayerList[game.homeTeamOrder[0]], made: true)
            let orderIndex = game.homeTeamOrder.removeAtIndex(0)
            game.homeTeamOrder.append(orderIndex)
            shooterName.text = game.homePlayerList[game.homeTeamOrder[0]].name
            tenShotSummary.text = game.homePlayerList[game.homeTeamOrder[0]].lastTenSummary()
            checkForEndOfTurn(playerCount, teamOrder: game.homeTeamOrder)
        }else{
            let playerCount = game.awayTeamOrder.count
            game.awayShotsTaken += 1
            game.awayPlayerList[game.awayTeamOrder[0]].bottomGays += 1
            trackLastTen(game.awayPlayerList[game.awayTeamOrder[0]], made: true)
            let orderIndex = game.awayTeamOrder.removeAtIndex(0)
            game.awayTeamOrder.append(orderIndex)
            shooterName.text = game.awayPlayerList[game.awayTeamOrder[0]].name
            tenShotSummary.text = game.awayPlayerList[game.awayTeamOrder[0]].lastTenSummary()
            checkForEndOfTurn(playerCount, teamOrder: game.awayTeamOrder)
        }
    }
    
    @IBAction func miss(sender: AnyObject) {
        if game.homeTeamUp{
            var playerCount = game.homeTeamOrder.count
            game.homeShotsTaken += 1
            game.homePlayerList[game.homeTeamOrder[0]].misses += 1
            trackLastTen(game.homePlayerList[game.homeTeamOrder[0]], made: false)
            if playerCount == 2 && game.homeTeamOrder[0] > game.homeTeamOrder[1]{
                playerCount -= 1
            }
            game.homeTeamOrder.removeAtIndex(0)
            if checkForEndOfTurn(playerCount, teamOrder: game.homeTeamOrder){
                shooterName.text = game.homePlayerList[game.homeTeamOrder[0]].name
                tenShotSummary.text = game.homePlayerList[game.homeTeamOrder[0]].lastTenSummary()
            }
        }else{
            var playerCount = game.awayTeamOrder.count
            game.awayShotsTaken += 1
            game.awayPlayerList[game.awayTeamOrder[0]].misses += 1
            trackLastTen(game.awayPlayerList[game.awayTeamOrder[0]], made: false)
            if playerCount == 2 && game.awayTeamOrder[0] > game.awayTeamOrder[1]{
                playerCount -= 1
            }
            game.awayTeamOrder.removeAtIndex(0)
            if checkForEndOfTurn(playerCount, teamOrder: game.awayTeamOrder){
                shooterName.text = game.awayPlayerList[game.awayTeamOrder[0]].name
                tenShotSummary.text = game.awayPlayerList[game.awayTeamOrder[0]].lastTenSummary()
            }
        }
    }
    

    func checkForEndOfTurn(playerCount:Int, teamOrder:NSArray) -> Bool {
        if playerCount<=1{
            if game.homeTeamUp{
                game.homeTeamUp = false
                game.homeTeamOrder = [0,1,2,3,4,5]
                shooterName.text = game.awayPlayerList[game.awayTeamOrder[0]].name
                tenShotSummary.text = game.awayPlayerList[game.awayTeamOrder[0]].lastTenSummary()
                currTeam.text = "Team 2"
                return false
            }
            else{
                game.homeTeamUp = true
                game.awayTeamOrder = [0,1,2,3,4,5]
                shooterName.text = game.homePlayerList[game.homeTeamOrder[0]].name
                tenShotSummary.text = game.homePlayerList[game.homeTeamOrder[0]].lastTenSummary()
                currTeam.text = "Team 1"
                return false
            }
        }else{
            return true
        }
    }
    
    func trackLastTen(player:Player, made:Bool) -> Void{
        if player.lastTen.count == 5{
            player.lastTen.removeAtIndex(0)
            player.lastTen.append(made)
        }else{
            player.lastTen.append(made)
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "dataSegue" {
            print("data segue")
            if let destination = segue.destinationViewController as? SecondViewController{
                destination.game = game
            }
        }
    }
    
}

