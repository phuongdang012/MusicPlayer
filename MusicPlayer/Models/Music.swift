//
//  Music.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 17/04/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import Foundation;
import Mapper;

class Music: Mappable{
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
  var coverPath: String?;
  var thumbnailPath: String?;
  var previewPath: String?;
  var artistImg: String?;
  
  required init(map: Mapper) throws {
    id = map.optionalFrom("music_id");
    titleUrl = map.optionalFrom("music_title_url");
    title = map.optionalFrom("music_title");
    artistName = map.optionalFrom("music_artist");
    composer = map.optionalFrom("music_composer");
    albumName = map.optionalFrom("music_album");
    productionCompany = map.optionalFrom("music_production");
    imgPath = map.optionalFrom("music_img");
    url128 = map.optionalFrom("file_url");
    url320 = map.optionalFrom("file_320_url");
    url500 = map.optionalFrom("file_m4a_url");
    urlLossless = map.optionalFrom("file_lossless_url");
    coverPath = map.optionalFrom("cover_img");
    thumbnailPath = map.optionalFrom("thumbnail");
    previewPath = map.optionalFrom("preview");
    artistImg = map.optionalFrom("artist_face_url");
  }
}
