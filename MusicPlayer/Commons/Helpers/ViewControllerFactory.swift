//
//  ViewControllerFactory.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 19/05/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import Foundation;
import UIKit;

class ViewControllerFactory{
  public static var shared = ViewControllerFactory();
  
  private var _trackViewController: TrackViewController!;
  private var _nativeLoginViewController: NativeLoginViewController!;
  private var _registerViewController: RegisterViewController!;
  private var _playlistViewController: PlaylistViewController!;
  
  var trackViewController: TrackViewController{
    get {
      if (_trackViewController == nil) {
        _trackViewController = TrackViewController();
      }
      return _trackViewController;
    }
  }
  
  var nativeLoginViewController: NativeLoginViewController{
    get{
      if (_nativeLoginViewController == nil) {
        _nativeLoginViewController = NativeLoginViewController();
      }
      return _nativeLoginViewController;
    }
  }
  
  var registerViewController: RegisterViewController{
    get{
      if(_registerViewController == nil){
        _registerViewController = RegisterViewController();
      }
      return _registerViewController;
    }
  }
  
  var playlistViewController: PlaylistViewController{
    get{
      if(_playlistViewController == nil){
        _playlistViewController = PlaylistViewController();
      }
      return _playlistViewController;
    }
  }
  
}
