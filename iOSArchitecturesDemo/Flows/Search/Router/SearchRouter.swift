//
//  SearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Igor Chernyshov on 04/04/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

protocol SearchRouterInput {
  func openDetails(for item: ITunesApp)
  func openDetails(for item: ITunesSong)
}

class SearchRouter: SearchRouterInput {
  
  weak var viewController: UIViewController?
  
  func openDetails(for app: ITunesApp) {
    let appDetailViewController = AppDetailViewController(app: app)
    self.viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
  }
  
  func openDetails(for song: ITunesSong) {
    let songDetailViewController = SongDetailViewController(song: song)
    self.viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
  }
  
}
