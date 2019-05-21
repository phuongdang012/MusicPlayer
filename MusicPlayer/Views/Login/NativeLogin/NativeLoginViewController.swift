//
//  NativeLoginViewController.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 18/05/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import UIKit;
import RxSwift;

class NativeLoginViewController: UIViewController {
  @IBOutlet weak var tbxUsername: IconTextField!
  @IBOutlet weak var tbxPassword: IconTextField!
  @IBOutlet weak var btnLogin: UIButton!
  @IBOutlet weak var btnRegister: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad();
  }
  
  func setupUI(){
    btnLogin.rx.tap.bind{
      if(tbxUsername.text?.isEmpty || tbxPassword.text?.isEmpty){
        
      }
    }
    
  }
  
}
