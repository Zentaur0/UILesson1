//
//  ScreenTransitionDismiss.swift
//  lesson1
//
//  Created by Антон Сивцов on 26.02.2021.
//

import UIKit

class ScreenTransitionDismiss: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        let sourceViewTargetFrame = CGRect(x: containerViewFrame.width, y: -100, width: source.view.frame.width, height: source.view.frame.height)
        let destinationViewTargetFrame = source.view.frame
        
        //добавление экрана с которого переходим
        transitionContext.containerView.addSubview(source.view)
        
        destination.view.frame = CGRect(x: -500, y: -100, width: source.view.frame.width, height: source.view.frame.height)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            source.view.frame = sourceViewTargetFrame
            destination.view.frame = destinationViewTargetFrame
        }) { finished in
            //удаление экрана с которого переходим
            source.removeFromParent()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    
}
