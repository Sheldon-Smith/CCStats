//
//  Game.swift
//  CCStats
//
//  Created by Graham Schilling on 12/27/15.
//  Copyright (c) 2015 Graham Schilling. All rights reserved.
//

import Foundation

class Game{
    var homePlayerList = [Player]()
    var awayPlayerList = [Player]()
    var homeShotsTaken:Double
    var awayShotsTaken:Double
    var shooterNumber:Int
    var homeTeamUp:Bool
    var homeTeamOrder = [Int]()
    var awayTeamOrder = [Int]()
    
    init(){
        self.homePlayerList = []
        self.awayPlayerList  = []
        self.homeShotsTaken = 0
        self.awayShotsTaken = 0
        self.shooterNumber = 0
        self.homeTeamUp = true
        self.homeTeamOrder = [0,1,2,3,4,5]
        self.awayTeamOrder = [0,1,2,3,4,5]
    }
}