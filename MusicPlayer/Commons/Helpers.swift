//
//  Helpers.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 19/04/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import Foundation;

class Helpers{
  private static var _instance: Helpers!;
  
  func getStringValue(key: String) -> String{
    let path = Bundle.main.path(forResource: "StringAssets", ofType: "plist");
    let dictRoot = NSDictionary(contentsOfFile: path!);
    let retrievedString = dictRoot![key] as! String;
    
    return retrievedString;
  }
  
  public static var shared: Helpers{
    if(_instance == nil){
      _instance = Helpers();
    }
    
    return _instance;
  }
}
