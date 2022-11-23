//
//  SceneCoordinator.swift
//  Core
//
//  Created by Ratchata Nuanchan on 23/11/2565 BE.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    func transition(type: SceneTransitionType) -> Observable<Void>
}

public class SceneCoordinator: SceneCoordinatorType {
    
    private weak var window: UIWindow!
    private var currentViewController: UIViewController {
        return UIViewController.topViewController() ?? UIViewController()
    }
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public init() {
        
    }
    
    @discardableResult
    public func transition(type: SceneTransitionType) -> Observable<Void> {
        let result = PublishSubject<Void>()
        
        switch type {
        case .root(let scene):
            let viewController = scene.viewController()
            let navigation = UINavigationController(rootViewController: viewController)
            self.window = UIApplication.getWindow()
            window.rootViewController = navigation
            window.makeKeyAndVisible()
            
            result.onCompleted()
            
            break
        case .push(let scene, let animated):
            let viewController = scene.viewController()
            if let navigationController = currentViewController.navigationController {
                navigationController.pushViewController(viewController, animated: animated)
                result.onCompleted()
            } else {
                fatalError("navigationController nil")
            }
            break
        case .backToRootAndPush(let scene, let animated):
            let viewController = scene.viewController()
            if let navigationController = currentViewController.navigationController {
                currentViewController.navigationController?.popToRootViewController(animated: animated)
                currentViewController.navigationController?.isNavigationBarHidden = false
                navigationController.pushViewController(viewController, animated: animated)
                result.onCompleted()
            } else {
                currentViewController.dismiss(animated: animated, completion: {
                    if let navigationController = self.currentViewController.navigationController {
                        navigationController.pushViewController(viewController, animated: animated)
                    } else {
                        fatalError("navigationController nil")
                    }
                })
            }
            break
        case .modal(let scene, let animated, let presentationStyle):
            let viewController = scene.viewController()
            viewController.modalPresentationStyle = presentationStyle
            let newRootNavigation = UINavigationController(rootViewController: viewController)
            newRootNavigation.modalPresentationStyle = viewController.modalPresentationStyle
            if let navigation = self.currentViewController.navigationController {
                navigation.present(newRootNavigation, animated: animated)
            } else {
                self.currentViewController.present(newRootNavigation, animated: animated)
            }
            
            break
        case .pop(let animated):
            if let navigationController = currentViewController.navigationController {
                navigationController.popViewController(animated: animated)
                result.onCompleted()
            } else {
                fatalError("navigationController nil")
            }
            break
        case .dismiss(let animated, let completion):
            if let presentingViewController = currentViewController.presentingViewController {
                
                presentingViewController.dismiss(animated: animated) {
                    completion?()
                    result.onNext(())
                    result.onCompleted()
                }
            } else {
                fatalError("presentingViewController nil")
            }
            break
        }
        
        return result.asObservable()
    }
}
