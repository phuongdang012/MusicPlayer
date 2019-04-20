//
//  LoginViewController.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 19/04/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import UIKit;
import GoogleSignIn;
import RxSwift;
import RxCocoa;

class LoginViewController: UIViewController {
  
  var disposableBag = DisposeBag();
  @IBOutlet weak var btnGoogleLogin: GIDSignInButton!;
  
  override func viewDidLoad() {
    super.viewDidLoad();
    self.setupGoogleSignIn();
    self.setupUIMocking();
    
  }
  
  func setupUIMocking(){
    btnGoogleLogin.colorScheme = .light;
    btnGoogleLogin.style = .wide;
  }
}

extension LoginViewController: GIDSignInUIDelegate{
  func setupGoogleSignIn(){
    GIDSignIn.sharedInstance()?.uiDelegate = self;
  }
  
  func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
    self.present(viewController, animated: true, completion: nil);
  }
  
  func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
    self.dismiss(animated: true, completion: nil);
  }
}
