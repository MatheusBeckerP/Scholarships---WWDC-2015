//
//  PMBDetailItemPortfolio.swift
//  portfolioMatheusBecker
//
//  Created by Matheus Becker on 22/04/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

import UIKit

class PMBDetailItemPortfolio: UIViewController {
    
    @IBOutlet weak var titele: UILabel!
    var itemValue : PMBPortfolioItems!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titele.text = itemValue.itemTitle as String
        
        println(itemValue)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         navigationController?.navigationBar.hidden = false
        
         }

}
