//
//  OfflineMusic.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 14/05/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import Foundation;
import RealmSwift;

class OffineMusic: Object{
  @objc dynamic var id: String!;
  @objc dynamic var name: String!;
  @objc dynamic var path: String!;
}
