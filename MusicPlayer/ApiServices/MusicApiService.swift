//
//  MusicApiServices.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 17/05/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import Foundation;
import RxSwift;
import Moya;
import Moya_ModelMapper;

class MusicApiServices{
  let apiProvider = MoyaProvider<MusicApiProvider>(plugins: [NetworkLoggerPlugin(verbose: true)]);
  
  func searchSongs(keyword: String) -> Observable<[Music]?>{
    let accessCode = Helpers.shared.getStringValue(key: "accessCode");
    
    return apiProvider.rx
      .request(.searchMusic(keyword: keyword, accessCode: accessCode))
      .debug()
      .asObservable()
      .mapOptional(to: [Music].self, keyPath: "music_list")
  }
  
  func getSongInfo(musicUrlName: String, musicId: String) -> Observable<Music?>{
    let accessCode = Helpers.shared.getStringValue(key: "accessCode");
    
    return apiProvider.rx
      .request(.getMusicInfo(accessCode: accessCode, musicId: musicId, musicUrlName: musicUrlName))
      .debug()
      .asObservable()
      .mapOptional(to: Music.self, keyPath: "music_info");
  }
  
  func getTopTrending() -> Observable<[Category]?>{
    let accessCode = Helpers.shared.getStringValue(key: "accessCode");
    let data = apiProvider.rx
      .request(.getHomeData(accessCode: accessCode))
      .debug("TopTrending", trimOutput: true)
      .asObservable()
      .mapOptional(to: [Category].self, keyPath: "category");
    return data
  }
}
