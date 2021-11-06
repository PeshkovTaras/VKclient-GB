//
//  CustomSegue.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 06.11.2021.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    
    override func perform() {
        guard let containerView = source.view.superview,
              let destinationView = destination.view
        else { return }
        
        let destinationFrame = source.view.frame
        containerView.addSubview(destination.view)
        destinationView.transform = CGAffineTransform(translationX: containerView.frame.width, y: -containerView.frame.height)
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options:[]) {
            destinationView.frame = destinationFrame

        } completion: { isSuccessfully in
            if isSuccessfully {
                self.source.present(self.destination, animated: false, completion: nil)
            }
        }
    }
}



