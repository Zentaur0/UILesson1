//
//  NavigationTransitionPush.swift
//  lesson1
//
//  Created by Антон Сивцов on 26.02.2021.
//

import UIKit

final class NavigationTransitionPush: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        let sourceViewTargetFrame = CGRect(x: -500, y: -100, width: source.view.frame.width, height: source.view.frame.height)
        
        let destinationViewTargetFrame = source.view.frame
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = CGRect(x: containerViewFrame.width, y: -100, width: source.view.frame.height, height: source.view.frame.width)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            source.view.frame = sourceViewTargetFrame
            destination.view.frame = destinationViewTargetFrame
        }) { finished in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    
}
