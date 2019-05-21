//
//  TrackMiniView.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 16/05/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import Foundation;
import UIKit;

class TrackMiniView: UIView{
  
  var musicPlayer: MusicPlayer!;
  
  @IBOutlet weak var imgvTrackImage: UIImageView!
  @IBOutlet weak var lblTrackName: ScrollingTextLabel!
  @IBOutlet weak var lblTrackArtist: UILabel!
  @IBOutlet weak var btnPrevTrack: UIButton!
  @IBOutlet weak var btnPlayPause: UIButton!
  @IBOutlet weak var btnNextTrack: UIButton!
  
  override init(frame: CGRect) {
    super.init(frame: frame);
    musicPlayer = MusicPlayer.sharedInstance();
    imgvTrackImage.layer.cornerRadius = imgvTrackImage.bounds.height / 2;
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder);
  }
  
  func setupUI(){
    btnPlayPause.rx.tap.bind(onNext: { _ in
//      self.musicPlayer.play();
    })
  }
}
