//
//  SearchField.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 14/05/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import Foundation;
import UIKit;

@IBDesignable
class IconField: UITextField{
  
  override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
    var textRect = super.leftViewRect(forBounds: bounds);
    textRect.origin.x += leftPadding;
    return textRect;
  }
  
  var leftIcon: UIImage?{
    didSet{
      renderView();
    }
  }
  
  func renderView(){
    
  }
}
