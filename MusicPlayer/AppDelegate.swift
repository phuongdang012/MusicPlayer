//
//  AppDelegate.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 17/04/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import UIKit;
import GoogleSignIn;

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?;

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.setupDependencies();
    self.setupInitialViewController();
    return true
  }
}

extension AppDelegate: GIDSignInDelegate{
  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    if let error = error{
      print(error.localizedDescription);
    }
    else{
      let userId = user.userID;
      let email = user.profile.email;
      let fullName = user.profile.name;
      
      let userDefaults = UserDefaults.standard;
      
      userDefaults.set(userId, forKey: "userId");
      userDefaults.set(email, forKey: "email");
      userDefaults.set(fullName, forKey: "fullName");
    }
    window?.rootViewController?.present(MainViewController(), animated: true, completion: nil);
  }
  
  func setupDependencies(){
    GIDSignIn.sharedInstance()?.clientID = "836124050403-ncprglar1hkcivc2scer9t5voave85c3.apps.googleusercontent.com";
    GIDSignIn.sharedInstance().delegate = self;
  }
  
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    return GIDSignIn.sharedInstance().handle(url as URL?,
                                             sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                             annotation: options[UIApplication.OpenURLOptionsKey.annotation])
  }
}

extension AppDelegate{
  func setupInitialViewController(){
    self.window = UIWindow(frame: UIScreen.main.bounds);
    
    let userDefaults = UserDefaults.standard;
    let userEmail = userDefaults.object(forKey: "email");
    
    if(userEmail == nil){
      window?.rootViewController = LoginViewController();
    }
    else{
      window?.rootViewController = MainViewController();
    }
    window?.makeKeyAndVisible();
  }
}
