//
//  PlayerViewController.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 20/04/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import UIKit;
import KDEAudioPlayer;

enum PlaylistPlayOption{
  case normal;
  case loopSingle;
  case loopAllList;
  case shuffle;
}

extension AudioPlayer{
  private static var _audioPlayer: AudioPlayer!;
  
  public static var shared: AudioPlayer{
    if(_audioPlayer == nil){
      _audioPlayer = AudioPlayer();
    }
    return _audioPlayer;
  }
  
  public static var isPlaying: Bool{
    return _audioPlayer!.state == .playing;
  }
}
