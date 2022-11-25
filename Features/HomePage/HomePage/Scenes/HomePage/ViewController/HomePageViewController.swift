//
//  HomePageViewController.swift
//  HomePage
//
//  Created by Ratchata Nuanchan on 23/11/2565 BE.
//

import UIKit
import Core
import RxSwift

public class HomePageViewController: UIViewController {
    
    static public let viewName = "HomePageView"
    static public let identifier = "HomePageViewController"
    
    public var opener: HomePageOpenerHandler = nil
    
    private var viewModel: HomePageViewModel? {
        didSet {
            bindViewModel()
        }
    }
    private var disposeBag = DisposeBag()
    
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
        viewModel?.loadAdvertises()
    }
    
    public func config(opener: HomePageOpenerHandler, viewModel: HomePageViewModel = HomePageViewModel()) {
        self.opener = opener
        self.viewModel = viewModel
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

}

// MARK: Binding ViewModel
extension HomePageViewController {
    func bindViewModel() {
        didLoadAdvertisesSuccess()
    }
    
    private func didLoadAdvertisesSuccess() {
        viewModel?
            .output
            .didLoadAdvertisesSuccess
            .subscribe(onNext: { advertises in
                let highestRateAdvertise = self.viewModel?.output.getHighestRateAdvertises()
                if let data = highestRateAdvertise?.image?.convertToURL()?.convertToData(), let image = UIImage.init(data: data) {
                    self.advertise.image = image
                }
            }).disposed(by: disposeBag)
    }
}
