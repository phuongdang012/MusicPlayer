//
//  PanningViewController.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 20/05/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import UIKit

class PanningViewController: UIViewController {
  
  var panGestureRecognizer: UIPanGestureRecognizer?
  var originalPosition: CGPoint?
  var currentPositionTouched: CGPoint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
    view.addGestureRecognizer(panGestureRecognizer!)
  }
  
  @objc private func panGestureAction(_ panGesture: UIPanGestureRecognizer) {
    let translation = panGesture.translation(in: view);
    
    if panGesture.state == .began {
      originalPosition = view.center
      currentPositionTouched = panGesture.location(in: view)
    } else if panGesture.state == .changed {
      view.frame.origin = CGPoint(
        x: 0,
        y: translation.y
      )
    } else if panGesture.state == .ended {
      let velocity = panGesture.velocity(in: view)
      
      if velocity.y >= 800 {
        UIView.animate(withDuration: 0.2
          , animations: {
            self.view.frame.origin = CGPoint(
              x: self.view.frame.origin.x,
              y: self.view.frame.size.height
            )
        }, completion: { (isCompleted) in
          if isCompleted {
            self.dismiss(animated: false, completion: nil)
          }
        })
      } else {
        UIView.animate(withDuration: 0.2, animations: {
          self.view.center = self.originalPosition!
        })
      }
    }
  }
  
}
