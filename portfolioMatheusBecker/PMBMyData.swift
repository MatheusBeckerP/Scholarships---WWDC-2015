//
//  PMBMyData.swift
//  portfolioMatheusBecker
//
//  Created by Matheus Becker on 23/04/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

import UIKit
import MediaPlayer



class PMBMyData: UIViewController{
    var moviePlayer : MPMoviePlayerController?
    
    @IBOutlet weak var webViewMyData: UIWebView!
    @IBOutlet weak var viewLayer: UIView!
    @IBAction func closeMyData(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        navigationController?.navigationBar.hidden = false

        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height

        var filePath = NSBundle.mainBundle().pathForResource("gif", ofType: "gif")
        var gif = NSData(contentsOfFile: filePath!)
        webViewMyData.loadData(gif, MIMEType: "image/gif", textEncodingName: nil, baseURL: nil)
        webViewMyData.userInteractionEnabled = false;
        webViewMyData.alpha = 0.25
    }
}
