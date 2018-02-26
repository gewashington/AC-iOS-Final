//
//  TabBarViewController.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainFeedVC = MainFeedViewController()
        let uploadVC = UploadViewController()
        

        
//        let mainFeedVC = UINavigationController(rootViewController: MainFeedViewController())
//        let uploadVC = UINavigationController(rootViewController: UploadViewController())
        mainFeedVC.tabBarItem = UITabBarItem(title: "Main Feed", image: #imageLiteral(resourceName: "chickenleg"), tag: 0)
        uploadVC.tabBarItem = UITabBarItem(title: "Upload", image: #imageLiteral(resourceName: "upload"), tag: 1)
        
        let navMainFeedVC = UINavigationController(rootViewController: mainFeedVC)
        let navUploadVC = UINavigationController(rootViewController: uploadVC)
        
        let listOfVC = [navMainFeedVC, navUploadVC]
        viewControllers = listOfVC
    
    }
    
    
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
