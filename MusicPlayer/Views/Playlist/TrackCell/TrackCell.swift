//
//  TrackTableViewCell.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 20/05/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
  
  @IBOutlet weak var imgvArtwork: UIImageView!;
  @IBOutlet weak var lblTitle: UILabel!;
  @IBOutlet weak var lblArtist: UILabel!;
  
  
  override func awakeFromNib() {
    super.awakeFromNib();
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated);
  }
  
}
