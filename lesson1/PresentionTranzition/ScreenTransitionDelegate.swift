//
//  ScreenTransitionDelegate.swift
//  lesson1
//
//  Created by Антон Сивцов on 26.02.2021.
//

import UIKit

// класс создается после создания переходов
final class ScreenTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
//    var interactionController: InteractiveTransition!
    
//    var isNeededToCloseImmidiately = false
    
    // в следующих методах возвращаем созданные переходы
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScreenTransitionPresent()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScreenTransitionDismiss()
    }
}
