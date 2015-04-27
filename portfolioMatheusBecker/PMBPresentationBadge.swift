//
//  ViewController.swift
//  portfolioMatheusBecker
//
//  Created by Matheus Becker on 20/04/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

import UIKit
import SceneKit
import AVFoundation

class PMBPresentationBadge: UIViewController {

    @IBOutlet weak var viewCamera: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        let captureSession = AVCaptureSession()
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        if let videoDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo) {
            var err: NSError? = nil
            if let videoIn : AVCaptureDeviceInput = AVCaptureDeviceInput.deviceInputWithDevice(videoDevice, error: &err) as? AVCaptureDeviceInput {
                if(err == nil){
                    if (captureSession.canAddInput(videoIn as AVCaptureInput)){
                        captureSession.addInput(videoIn as AVCaptureDeviceInput)
                    }
                    else {
                        println("Failed add video input.")
                    }
                }
                else {
                    println("Failed to create video input.")
                }
            }
            else {
                println("Failed to create video capture device.")
            }
        }
        captureSession.startRunning()
        
        previewLayer.frame = self.view.bounds
        self.viewCamera.layer.addSublayer(previewLayer)
      
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        showMyBadge()
    }

    
    func showMyBadge(){
        //metricas
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let fullRotation = CGFloat (M_PI * 2 )
        
        // Imagem
        let badge = UIImageView()
        badge.image = UIImage(named: "card")
        badge.contentMode = .ScaleAspectFit
        
        badge.frame = CGRectMake(screenWidth * -0.05, -900, screenWidth * 1.1, screenHeight * 1.1)
        self.view.addSubview(badge)
        
        self.view.backgroundColor = UIColor(red: 0.11, green: 0.0, blue: 0.47, alpha: 1.0)
        
        // animation 1
        UIView.animateWithDuration(0.5, delay: 0.7, options: UIViewAnimationOptions.CurveEaseIn, animations:
            {
                badge.frame = CGRect(x: screenWidth * -0.05,
                    y: screenHeight * -0.01, width: screenWidth * 1.1, height: screenHeight * 1.1)
                badge.transform = CGAffineTransformMakeRotation (fullRotation - 0.1)
            }, completion:
            { animationFinished in
                
                //animation 2
                UIView.animateWithDuration(0.5, animations:
                    {
                        badge.frame = CGRect(x: screenWidth * -0.05,
                            y: screenHeight * -0.4, width: screenWidth * 1.1, height: screenHeight * 1.1)
                        badge.transform = CGAffineTransformMakeRotation (fullRotation + 0.1)
                    }, completion:
                    { animationFinished in
                        
                        //animation 3
                        UIView.animateWithDuration(0.5, animations:
                            {
                                badge.frame = CGRect(x: screenWidth * -0.05,
                                    y: screenHeight * -0.09, width: screenWidth * 1.1, height: screenHeight * 1.1)
                                badge.transform = CGAffineTransformMakeRotation (fullRotation - 0.09)
                            }, completion:
                            { animationFinished in
                                
                                //animation 4
                                UIView.animateWithDuration(0.5, animations:
                                    {
                                        badge.frame = CGRect(x: screenWidth * -0.05,
                                            y: screenHeight * -0.2, width: screenWidth * 1.1, height: screenHeight * 1.1)
                                        badge.transform = CGAffineTransformMakeRotation (fullRotation + 0.02)
                                    }, completion:
                                    { animationFinished in
                                        
                                        //animatio 5
                                        UIView.animateWithDuration(0.6, animations:
                                            {
                                                badge.frame = CGRect(x: screenWidth * -0.05,
                                                    y: screenHeight * -0.2, width: screenWidth * 1.1, height: screenHeight * 1.1)
                                                badge.transform = CGAffineTransformMakeRotation (fullRotation - 0.01)
                                            }, completion:
                                            { animationFinished in
                                                
                                                //animation 6
                                                UIView.animateWithDuration(0.7, animations:
                                                    {
                                                        badge.frame = CGRect(x: screenWidth * -0.05,
                                                            y: screenHeight * -0.2, width: screenWidth * 1.1, height: screenHeight * 1.1)
                                                        badge.transform = CGAffineTransformMakeRotation (fullRotation)
                                                })
                                        })
                                })
                        })

                })
        })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

