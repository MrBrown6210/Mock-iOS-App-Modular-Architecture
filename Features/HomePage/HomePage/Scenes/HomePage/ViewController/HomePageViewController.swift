//
//  HomePageViewController.swift
//  HomePage
//
//  Created by Ratchata Nuanchan on 23/11/2565 BE.
//

import UIKit

public class HomePageViewController: UIViewController {
    
    static public let viewName = "HomePageView"
    static public let identifier = "HomePageViewController"

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
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
