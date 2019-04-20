//
//  LeftMenuViewController.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 20/04/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {
  
  @IBOutlet weak var userAvatar: UIImageView!;
  @IBOutlet weak var lblFullName: UILabel!;
  @IBOutlet weak var lblUserEmail: UILabel!;
  @IBOutlet weak var tbvUserOption: UITableView!;
  
  override func viewDidLoad() {
    super.viewDidLoad();
  }
  
  func setupUI(){
    let 
  }
}

extension LeftMenuViewController: UITableViewDelegate{
  func setupTableView(){
    tbvUserOption.delegate = self;
  }
}
