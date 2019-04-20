//
//  MusicApiProvider.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 20/04/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import Foundation;
import Moya;

enum MusicApiProvider{
  case searchMusic(keyword: String, accessCode: String);
  case getMusicInfo(accessCode: String, musicId: String, musicUrlName: String);
  case downloadMusic;
}

extension MusicApiProvider: TargetType{
  var baseURL: URL {
    switch self {
    case .searchMusic:
      return URL(string: Helpers.shared.getStringValue(key: "searchUrl"))!;
    case .getMusicInfo:
      return URL(string: Helpers.shared.getStringValue(key: "musicInfoUrl"))!;
    default:
      return URL(string: "")!;
    }
  }
  
  var path: String {
    switch self {
    case .searchMusic:
      return "/api/search.php";
    case .getMusicInfo:
      return "/api/listen.php";
    default:
      return "";
    }
  }
  
  var method: Moya.Method {
    return .get;
  }
  
  var sampleData: Data {
    return Data();
  }
  
  var task: Task {
    switch self {
    case .searchMusic(let keyword, let accessCode):
      return .requestParameters(parameters: ["s": keyword, "code": accessCode, "per_page": "20"], encoding: URLEncoding.default);
    case .getMusicInfo(let accessCode, let musicId, let musicUrlName):
      return .requestParameters(parameters: ["code": accessCode, "return": "json", "m": musicId, "url": musicUrlName], encoding: URLEncoding.default);
    default:
      return .requestPlain;
    }
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application/json"];
  }
}
