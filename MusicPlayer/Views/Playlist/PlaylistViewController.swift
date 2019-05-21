//
//  PlaylistViewController.swift
//  MusicPlayer
//
//  Created by Trần Thành Phương Đăng on 19/05/19.
//  Copyright © 2019 phuongdang. All rights reserved.
//

import UIKit;
import KDEAudioPlayer;
import RxCocoa;
import RxSwift;

class PlaylistViewController: PanningViewController {
  
  var queue = Variable<[AudioItem]>([]);
  var disposableBag = DisposeBag();
  
  @IBOutlet weak var tbvTrackList: UITableView!;
  @IBOutlet weak var lblHeader: UILabel!
  @IBOutlet weak var tbxFilter: IconTextField!
  @IBOutlet weak var btnDismiss: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad();
    setupUIDependencies();
    setupUIBinding();
  }
  
  func setupUIDependencies(){
    tbvTrackList.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "cell");
    tbvTrackList.tableFooterView = UIView();
  }
  
  func setupUIBinding(){
    let result = tbxFilter.rx.text.orEmpty
      .throttle(0.3, scheduler: MainScheduler.instance)
      .distinctUntilChanged()
      .flatMapLatest{ query -> Observable<[AudioItem]> in
        if(query.isEmpty){
          return self.queue.asObservable();
        }
          return self.queue.asObservable()
            .map({ $0.filter({ $0.title == query || $0.artist == query }) });
      }.observeOn(MainScheduler.instance);
    
    result.bind(to: tbvTrackList.rx.items){
      (tableView, row, item) in
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchResultTableViewCell;
      cell.lblSongName.text = item.title;
      cell.lblSongArtist.text = item.artist;
      cell.imgvSongImg.image = item.artworkImage;
      
      return cell;
      }.disposed(by: disposableBag);
    
    btnDismiss.rx.tap
      .bind{
      self.dismiss(animated: true, completion: nil);
      }.disposed(by: disposableBag);
  }
}
