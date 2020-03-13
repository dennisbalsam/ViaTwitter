//
//  TweetViewController.swift
//  Twitter
//
//  Created by user165734 on 3/13/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tweet.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    // cancel a tweet
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var tweet: UITextView!
    
    @IBAction func tweet(_ sender: Any) {
        if (!tweet.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweet.text, success: {
                    self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                    print("Error posting tweet \(error)")
                    self.dismiss(animated: true, completion: nil)
            })
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
