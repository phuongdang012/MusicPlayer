//
//  MainViewController.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 19/04/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import UIKit;
import RxSwift;
import RxCocoa;
import GoogleSignIn;

class MainViewController: UIViewController {
  
  var disposeBag = DisposeBag();
  @IBOutlet weak var btnLogout: UIButton!;
  
  override func viewDidLoad() {
    super.viewDidLoad();
    setupUI();
  }
  
  func setupUI(){
    btnLogout.rx.tap
      .debounce(0.5, scheduler: MainScheduler.instance)
      .subscribe(onNext: { [weak self] _ in
        GIDSignIn.sharedInstance()?.signOut();
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let loginViewController = LoginViewController();
        appDelegate.window?.rootViewController = loginViewController;
      })
      .disposed(by: disposeBag);
  }
}
