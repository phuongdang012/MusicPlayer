//
//  Helpers.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 19/04/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import Foundation;
import KDEAudioPlayer;

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
  
  func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
  }
  
  func convertToAudioItem(from: Music) -> AudioItem{
    let audioItem = AudioItem(soundURLs: [AudioQuality.low: URL(string: from.url128!)!]);
    
    audioItem?.artist = from.artistName;
    UIImageView().getImage(from: from.imgPath!){ image in
      audioItem?.artworkImage = image;
    }
    audioItem?.title = from.title;
    
    return audioItem!;
  }
}

class FileSystem{
  static let documentsDirectory: URL = {
    let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return urls[urls.endIndex - 1]
  }()
  
  static let cacheDirectory: URL = {
    let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
    return urls[urls.endIndex - 1]
  }()
  
  static let downloadDirectory: URL = {
    let directory: URL = FileSystem.documentsDirectory.appendingPathComponent("/Download/")
    return directory
  }()
}


