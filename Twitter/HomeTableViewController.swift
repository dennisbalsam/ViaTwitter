//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by user165734 on 3/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    
    //container for tweets
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onLogout(_ sender: Any) {
        //call logout function
        TwitterAPICaller.client?.logout()
        //go back to login page
        self.dismiss(animated: true, completion: nil)
        
        //set key for remembering login to false
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCellTableViewCell
        
        cell.userName.text = "Shaun Kruskal"
        cell.tweetDetails.text = "Is a ginger"
        
        
        return cell
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
}
