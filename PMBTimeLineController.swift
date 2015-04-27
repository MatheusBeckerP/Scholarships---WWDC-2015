//
//  timeLineController.swift
//  portfolioMatheusBecker
//
//  Created by Matheus Becker on 20/04/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

import UIKit
import SceneKit
import AVFoundation

class PMBTimeLineController: UIViewController, UITableViewDelegate, UITableViewDataSource,  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    @IBOutlet weak var portfolioCollection: UICollectionView?
    @IBOutlet weak var portfolioTable: UITableView!
    @IBOutlet weak var camera: UIView!
    
    var arrayEducation = NSMutableArray()
    var arraySkills = NSMutableArray()
    var arrayCollection = NSMutableArray()
    var arrayApp = NSMutableArray()
    var arrayInternationalE = NSMutableArray()
    var popViewController : PMBPopViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        portfolioTable.delegate = self
        portfolioTable.dataSource = self
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        self.buildItems()
        
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
        self.camera.layer.addSublayer(previewLayer)
        portfolioCollection!.dataSource = self
        portfolioCollection!.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.hidden = true
    }
    

    
    func buildItems(){
        
        
        //TableView Itens
        //Skills
        var C = PMBPortfolioItems()
        C.itemTitle = "Knowledge in Programming Languages"
        C.itemDescription = "C, C#, C++, Objective-C, Swift, Java, Php, Sql"
        arraySkills.addObject(C)
        
        //Education
        var ulbra = PMBPortfolioItems()
        ulbra.itemTitle = "Lutheran University of Brazil - ULBRA"
        ulbra.itemDescription = "Analysis and systems development\n2011/1 - 2015/2 (provided for)"
        arrayEducation.addObject(ulbra)
        
        var bepid = PMBPortfolioItems()
        bepid.itemTitle = "BEPiD"
        bepid.itemDescription = "Porto Alegre - Brazil\n2015"
        arrayEducation.addObject(bepid)
        
        var cp = PMBPortfolioItems()
        cp.itemTitle = "Developing applications for Iphone"
        cp.itemDescription = "Administered by ULBRA\n2013"
        arrayEducation.addObject(cp)
        
        //Apps
        var appleStore = PMBPortfolioItems()
        appleStore.itemTitle = "Apple Store"
        appleStore.itemDescription = "ICC-Serra, Wob Lists"
        arrayApp.addObject(appleStore)
        
        var wp = PMBPortfolioItems()
        wp.itemTitle = "Windows Phone"
        wp.itemDescription = "Baixar Sertanejo, Medida Certa, Tabuada com a Mão"
        arrayApp.addObject(wp)
        
        //International
        var chile = PMBPortfolioItems()
        chile.itemTitle = "University of Chile"
        chile.itemDescription = "Participation in international social networking forum"
        arrayInternationalE.addObject(chile)
        
        var portugal = PMBPortfolioItems()
        portugal.itemTitle = "University New Lisbon"
        portugal.itemDescription = "Participation in a meeting on master exchange"
        arrayInternationalE.addObject(portugal)
        
        
        //CollectionView Itens
        let wob = PMBCollectionItens()
        wob.itemTitle = "Wob Lists"
        wob.itemImage = "wob"
        wob.itemDesc = "Wob is intended to end the lists of paper. With a simple and quick method you can put together a list to go to the supermarket to buy some products or a simple list of daily tasks. With Wob you avoid paper waste and optimizes your day. Available in Apple Store."
        arrayCollection.addObject(wob)
        
        let icc = PMBCollectionItens()
        icc.itemTitle = "ICC-Serra"
        icc.itemImage = "icc"
        icc.itemDesc = "The official app of the People's Bank - ICC Serra. With it you can simulate the desired credit value, know better about our company and visit our web site. Available in Apple Store."
        arrayCollection.addObject(icc)
        
        let muambator = PMBCollectionItens()
        muambator.itemTitle = "Muambator"
        muambator.itemImage = "muambator"
        muambator.itemDesc = "The first Brazilian application notifications and organization to control deliveries. Supports tracking orders with various types of alerts included push notifications. Available in Apple Store."
        arrayCollection.addObject(muambator)
        
        let colabore = PMBCollectionItens()
        colabore.itemTitle = "Colaborê"
        colabore.itemImage = "colabore"
        colabore.itemDesc = "Colaborê will assist in the maintenance of cities, where its users, can they inform the city that something is wrong in one place. You will create a notification with photo, where it will be sent to the competent organ. In production."
        arrayCollection.addObject(colabore)
        
        let pebaixo = PMBCollectionItens()
        pebaixo.itemTitle = "PéBaixo"
        pebaixo.itemImage = "pebaixo"
        pebaixo.itemDesc = "The PéBaixo aims to help its users find shoes near being offered, with information such as price and distance. This application also aims to take the user to the store that sells the product chosen for that it presents features such as map and route the user to the store. In production."
        arrayCollection.addObject(pebaixo)
        
        let roundtrip = PMBCollectionItens()
        roundtrip.itemTitle = "RoundTrip"
        roundtrip.itemImage = "roundTrip"
        roundtrip.itemDesc = "RoundTrip will help you plan your trip, organizing a user-chosen script and indicating points of interest to help you better enjoy your trip. In production."
        arrayCollection.addObject(roundtrip)
    }

    
    // MARK:  UITableViewDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var row = 0
        switch (section){
            
        case 0:
            row = arrayEducation.count
        case 1:
            row = arrayApp.count
        case 2:
            row = arrayInternationalE.count
        case 3:
            row = arraySkills.count
            
        default: ""
        }
    
        return row
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

    let headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! PMBCustomHeaderCell
    headerCell.backgroundColor = UIColor .whiteColor()
    
        switch (section) {
        case 0:
            headerCell.lblHeader.text = "education"
         
        case 1:
            headerCell.lblHeader.text = "published applications"
        
        case 2:
            headerCell.lblHeader.text =  "international experience"
            
        case 3:
            headerCell.lblHeader.text = "skills"

        default:
            headerCell.lblHeader.text = ""
        }
        
        return headerCell
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : PMBCustomCell = portfolioTable.dequeueReusableCellWithIdentifier("cell") as! PMBCustomCell
        
        switch (indexPath.section) {
        
        case 0:
            var itenEducation : PMBPortfolioItems = arrayEducation[indexPath.row] as! PMBPortfolioItems
             cell.lblTitle.text = itenEducation.itemTitle as String
             cell.lblDescription.text = itenEducation.itemDescription as String
        case 1:
            var itenApp : PMBPortfolioItems = arrayApp[indexPath.row] as! PMBPortfolioItems
            cell.lblTitle.text = itenApp.itemTitle as String
            cell.lblDescription.text = itenApp.itemDescription as String
        case 2:
            var itenInternationalE : PMBPortfolioItems = arrayInternationalE[indexPath.row] as! PMBPortfolioItems
            cell.lblTitle.text = itenInternationalE.itemTitle as String
            cell.lblDescription.text = itenInternationalE.itemDescription as String
        case 3:
            var itenSkills : PMBPortfolioItems = arraySkills[indexPath.row] as! PMBPortfolioItems
            cell.lblTitle.text = itenSkills.itemTitle as String
            cell.lblDescription.text = itenSkills.itemDescription as String
        default:
            cell.textLabel?.text = ""
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        portfolioTable.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    
    //MARK: UICollectionViewDelegate
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCollection.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : PMBCollectionCell = portfolioCollection!.dequeueReusableCellWithReuseIdentifier("CCell", forIndexPath: indexPath) as! PMBCollectionCell
         var itemCollectionArray = arrayCollection[indexPath.row] as! PMBCollectionItens

            cell.lblNameLabel.text = itemCollectionArray.itemTitle as String
        
            let nameImage = itemCollectionArray.itemImage as String
            cell.imgLogoApp.layer.masksToBounds = true
            cell.imgLogoApp.image = UIImage(named: nameImage)
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 4.0
        return CGSizeMake(picDimension, picDimension)
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 200.0
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let obj = arrayCollection[indexPath.row] as! PMBCollectionItens
     
        if UIScreen.mainScreen().bounds.size.width > 320 {
            if UIScreen.mainScreen().scale == 3 {
                self.popViewController = PMBPopViewController(nibName: "PopUpViewController_iPhone6Plus", bundle: nil)
                self.popViewController.title = obj.itemDesc as String
                self.popViewController.showInView(self.view, withImage: UIImage(named: obj.itemImage as String), withMessage: obj.itemDesc as String, animated: true)
            } else {
                self.popViewController = PMBPopViewController(nibName: "PopUpViewController_iPhone6", bundle: nil)
                self.popViewController.title = obj.itemDesc as String
                self.popViewController.showInView(self.view, withImage: UIImage(named: obj.itemImage as String), withMessage: obj.itemDesc as String, animated: true)
            }
        } else {
            self.popViewController = PMBPopViewController(nibName: "PopUpViewController", bundle: nil)
            self.popViewController.title = obj.itemDesc as String
            self.popViewController.showInView(self.view, withImage: UIImage(named: obj.itemImage as String), withMessage: obj.itemDesc as String, animated: true)
        }
    }
}