//
//  UIVewControllerExtn.swift
//  GoalPost
//
//  Created by Roman Tuzhilkin on 7/29/20.
//  Copyright © 2020 Roman Tuzhilkin. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    //Dismissing the first VC so that we can present the next one right after and then dismiss to the beginning.
    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        
        guard let presentedVC = presentedViewController else { return }
        
        presentedVC.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            
            viewControllerToPresent.modalPresentationStyle = .fullScreen
            
            self.present(viewControllerToPresent, animated: false, completion: nil)

            
        }
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}
