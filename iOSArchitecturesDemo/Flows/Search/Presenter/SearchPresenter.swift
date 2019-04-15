//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 27/03/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

/// Presenter.
/// View owns a presenter and reports it user interaction events.
/// Presenter owns an interactor and a router.
/// All requests to services are sent to interactor.
/// All navigation requests are sent to router.
final class SearchPresenter {
  
  // MARK: - Dependencies
  
  weak var viewInput: (UIViewController & SearchViewInput)?
  let interactor: SearchInteractorInput
  let router: SearchRouterInput
  
  // MARK: - Init
  
  init(interactor: SearchInteractorInput, router: SearchRouterInput) {
    self.interactor = interactor
    self.router = router
  }
  
  // MARK: - Interactor requests
  
  private func requestApps(with query: String) {
    self.interactor.requestApps(with: query) { [weak self] result in
      guard let self = self else { return }
      self.viewInput?.throbber(show: false)
      result
        .withValue { apps in
          guard !apps.isEmpty else {
            self.viewInput?.showNoResults()
            return
          }
          self.viewInput?.hideNoResults()
          self.viewInput?.searchResults = apps
        }
        .withError {
          self.viewInput?.showError(error: $0)
      }
    }
  }
  
  private func requestSongs(with query: String) {
    self.interactor.requestSongs(with: query) { [weak self] result in
      guard let self = self else { return }
      self.viewInput?.throbber(show: false)
      result
        .withValue { songs in
          guard !songs.isEmpty else {
            self.viewInput?.showNoResults()
            return
          }
          self.viewInput?.hideNoResults()
          self.viewInput?.searchResults = songs
        }
        .withError {
          self.viewInput?.showError(error: $0)
        }
    }
  }
  
}

// MARK: - SearchViewOutput
extension SearchPresenter: SearchViewOutput {
  
  func viewDidSearch(with query: String) {
    self.viewInput?.throbber(show: true)
    if viewInput?.tabBarController?.selectedIndex == 0 {
      self.requestApps(with: query)
    } else {
      self.requestSongs(with: query)
    }
  }
  
  func viewDidSelect(app: ITunesApp) {
    self.router.openDetails(for: app)
  }
  
  func viewDidSelect(song: ITunesSong) {
    self.router.openDetails(for: song)
  }

}
