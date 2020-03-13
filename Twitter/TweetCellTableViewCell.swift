//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by user165734 on 3/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    
    // UI componentd
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var tweetDetails: UILabel!
    
    @IBOutlet weak var retweetBtn: UIButton!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    var favorited:Bool = false
    var tweetId: Int = -1
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            likeBtn.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            likeBtn.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
        
    }
    //like or retweet a tweet
    @IBAction func retweetTweet(_ sender: Any) {
        
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        
        if(tobeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("favorite did not succeed: \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("favorite did not succeed: \(error)")
            })
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
