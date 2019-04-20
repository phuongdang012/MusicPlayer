//
//  AppDelegateExtension.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 17/04/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import Foundation;
import GoogleSignIn;

extension AppDelegate: GIDSignInDelegate{
  func setupDependencies(){
    GIDSignIn.sharedInstance().clientId = "836124050403-ncprglar1hkcivc2scer9t5voave85c3.apps.googleusercontent.com";
    GIDSignIn.sharedInstance().delegate = self;
  }
  
  func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    return GIDSignIn.sharedInstance().handle(url as URL?,
                                             sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                             annotation: options[UIApplicationOpenURLOptionsKey.annotation])
  }
}
