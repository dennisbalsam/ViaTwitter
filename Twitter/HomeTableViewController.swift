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
    var tweetArray = [NSDictionary]()
    var numberOfTweets: Int!
    
    
    //get tweets from APi
    func getTweets() {
        //url var
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let myParams = ["count": 10]
        //call api
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParams, success: { (tweets:[NSDictionary]) in
            //clear list before storing new
            self.tweetArray.removeAll()
            //store tweets locally
            for tweet in tweets {
                self.tweetArray.append(tweet)
            }
            //reload the data
            self.tableView.reloadData()
        //failure clause
        }, failure: {(Error) in
            print("Could not retrieve tweets")
            
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get tweets
        getTweets()

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
        
        
        //user
        let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        let tweet = tweetArray[indexPath.row]["text"] as! String
        
        
        //change data in UI
        cell.userName.text = user["name"] as? String
        cell.tweetDetails.text = tweet
        
        //set image
        let imageUrl = URL(string: ((user["profile_image_url_https"] as? String)!))
        let data = try? Data(contentsOf: imageUrl!)
        
        if let imageData = data {
            cell.profilePicture.image = UIImage(data: imageData)
        }
        
        
        return cell
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweetArray.count
    }

    
}
