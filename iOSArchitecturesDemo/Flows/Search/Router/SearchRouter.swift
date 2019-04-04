//
//  SearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Igor Chernyshov on 04/04/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

protocol SearchRouterInput {
  func openDetailsFor(_ item: Any)
}

class SearchRouter: SearchRouterInput {
  
  weak var viewController: UIViewController?
  
  func openDetailsFor(_ item: Any) {
    if let item = item as? ITunesApp {
      let appDetailViewController = AppDetailViewController(app: item)
      self.viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
    } else if let item = item as? ITunesSong {
      let songDetailViewController = SongDetailViewController(song: item)
      self.viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
  }
  
}
