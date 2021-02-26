//
//  ScreenTransitionPresent.swift
//  lesson1
//
//  Created by Антон Сивцов on 26.02.2021.
//

import UIKit

final class ScreenTransitionPresent: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // view с которого осуществляется переход
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        
        // view на который осуществляется переход
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        // MARK: Animation
        
        // получаем frame conteinerView
        let containerViewFrame = transitionContext.containerView.frame
        
        // создаем target frame
        let sourceViewTargetFrame = CGRect(x: -500, y: -100, width: source.view.frame.width, height: source.view.frame.height)
        
        let destinationViewTargetFrame = source.view.frame
        
        //добавляем в контейнер destinationView экран на который переходим
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = CGRect(x: containerViewFrame.width, y: -100, width: source.view.frame.width, height: source.view.frame.height)
        
        // создаем анимацию, блок completion вызывается обязательно
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            source.view.frame = sourceViewTargetFrame
            destination.view.frame = destinationViewTargetFrame
        }) { finished in
            // удаляем экран из родителя
                destination.removeFromParent()
            // если переход был отменен
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
