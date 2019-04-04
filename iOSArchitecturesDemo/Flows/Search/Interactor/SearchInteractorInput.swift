//
//  SearchInteractorInput.swift
//  iOSArchitecturesDemo
//
//  Created by Igor Chernyshov on 04/04/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import Foundation
import Alamofire

/// Interactor - In this case it is a proxy between Presenter and Service (Model layer)
protocol SearchInteractorInput {
  func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void)
  func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}

final class SearchInteractor: SearchInteractorInput {
  
  private let searchService = ITunesSearchService()
  
  func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void) {
    self.searchService.getApps(forQuery: query) { result in
      completion(result)
    }
  }
  
  func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
    self.searchService.getSongs(forQuery: query) { result in
      completion(result)
    }
  }
  
}
