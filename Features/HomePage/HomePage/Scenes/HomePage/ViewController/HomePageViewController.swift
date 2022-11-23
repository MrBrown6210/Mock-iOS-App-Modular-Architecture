//
//  HomePageViewController.swift
//  HomePage
//
//  Created by Ratchata Nuanchan on 23/11/2565 BE.
//

import UIKit
import Core

public class HomePageViewController: UIViewController {
    
    static public let viewName = "HomePageView"
    static public let identifier = "HomePageViewController"
    
    public var opener: HomePageOpenerHandler = nil
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var deliveryButton: UIButton!
    @IBOutlet weak var taxiButton: UIButton!
    @IBOutlet weak var advertise: UIImageView!

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    public func config(opener: HomePageOpenerHandler) {
        self.opener = opener
    }
    
    func setupUI() {
        welcomeLabel.setStyle(.h1Black)
        welcomeLabel.text = "Hi Ratchanon"
        
        deliveryButton.setStyle(style: .secondary)
        deliveryButton.setTitle("Food", for: .normal)
        
        taxiButton.setStyle(style: .secondary)
        taxiButton.setTitle("Taxi", for: .normal)
        
    }
    
    @IBAction func deliveryButtonWasTapped() {
        opener?(.deliveryHome)
    }
    
    @IBAction func taxiButtonWasTapped() {
        opener?(.taxiHome)
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
