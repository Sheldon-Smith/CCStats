//
//  StarterViewController.swift
//  CCStats
//
//  Created by Graham Schilling on 12/27/15.
//  Copyright (c) 2015 Graham Schilling. All rights reserved.
//

import UIKit

class StarterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var AddPlayerButton: UIButton!
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var playerCount: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var playerTable: UITableView!
    
    var playersCount = 0
    var currGame = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGameButton.enabled = false
        playerCount.text = "Number of Players: 0"
        self.playerTable.registerNib(UINib(nibName: "PlayerTableHomeViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.playerTable.delegate = self
        self.playerTable.dataSource = self
        self.playerName.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StarterViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func addPlayerButton(sender: AnyObject) {
        action()
    }
    
    
    func action() {
        if self.playerName.text != "" {
            playersCount += 1
            playerCount.text = "Number of Players: " + String(playersCount)
            let player = Player(name: playerName.text!)
            if playersCount <= 6{
                currGame.homePlayerList.append(player)
            } else{
                currGame.awayPlayerList.append(player)
            }
            playerName.text = ""
            if playersCount == 12{
                startGameButton.enabled = true
                AddPlayerButton.enabled = false
            }
            playerTable.reloadData()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.action()
        return true
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Home Team"
        } else {
            return "Away Team"
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = playerTable.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PlayerTableHomeViewCell
        if (indexPath.section == 0) {
        cell.PlayerName.text = currGame.homePlayerList[indexPath.row].name
        } else {
        cell.PlayerName.text = currGame.awayPlayerList[indexPath.row].name
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return currGame.homePlayerList.count
        }
        else {
            return currGame.awayPlayerList.count
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
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
