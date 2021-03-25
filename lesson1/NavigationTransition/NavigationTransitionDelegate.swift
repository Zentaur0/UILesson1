//
//  NavigationTransitionDelegate.swift
//  lesson1
//
//  Created by Антон Сивцов on 26.02.2021.
//

import UIKit

final class NavigationTransitionDelegate: NSObject, UINavigationControllerDelegate {
    
    let interactiveTransition = InteractiveNavigationAnimation()
    
    func navigationController(_ navigationController: UINavigationController,
                              interactionControllerFor animationController: UIViewControllerAnimatedTransitioning)
                              -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
                self.interactiveTransition.viewController = toVC
                return NavigationTransitionPush()
            } else if operation == .pop {
                if navigationController.viewControllers.first != toVC {
                    self.interactiveTransition.viewController = toVC
                }
                return NavigationTransitionPop()
            }
            return nil
    }
}
