//
//  ViewController.swift
//  DebeiHome
//
//  Created by 李永杰 on 2019/3/15.
//  Copyright © 2019 Y了个J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let homeViewModel = HomeViewModel()
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeCollectionView.dataSource = homeViewModel
        
    }


}


