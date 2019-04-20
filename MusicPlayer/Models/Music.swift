//
//  Music.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 17/04/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import Foundation;
import ObjectMapper;
import Moya_ObjectMapper;

class Music: Mappable{
  required convenience init?(map: Map) {
    self.init();
  }
  
  func mapping(map: Map) {
    id <- map["music_id"];
    titleUrl <- map["music_title_url"];
    title <- map["music_title"];
    artistName <- map["music_artist"];
    composer <- map["music_composer"];
    albumName <- map["music_album"];
    productionCompany <- map["music_production"];
    imgPath <- map["music_img"];
    url128 <- map["file_url"];
    url320 <- map["file_320_url"];
    url500 <- map["file_m4a_url"];
    urlLossless <- map["file_lossless_url"];
  }
  
  var id: String?;
  var titleUrl: String?;
  var title: String?;
  var artistName: String?;
  var composer: String?;
  var albumName: String?;
  var productionCompany: String?;
  var imgPath: String?;
  var url128: String?;
  var url320: String?;
  var url500: String?;
  var urlLossless: String?;
}
