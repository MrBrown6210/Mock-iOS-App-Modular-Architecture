//
//  InitialPageViewController.swift
//  MockLineMan
//
//  Created by Ratchata Nuanchan on 22/11/2565 BE.
//

import UIKit
import Core
import HomePage

class InitialPageViewController: UIViewController {
    
    static public let viewName = "InitialPageView"
    static public let identifier = "InitialPageViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let scene: SceneType = HomePageScene.homePage
        let transition: SceneTransitionType = .root(scene: scene)
        let coordinator: SceneCoordinator = SceneCoordinator()
        coordinator.transition(type: transition)
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
