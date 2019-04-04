//
//  SearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 27/03/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class SearchModuleBuilder {
  
  static func build() -> (UIViewController & SearchViewInput) {
    let interactor = SearchInteractor()
    let router = SearchRouter()
    let presenter = SearchPresenter(interactor: interactor, router: router)
    let viewController = SearchViewController(output: presenter)
    
    presenter.viewInput = viewController
    router.viewController = viewController
    
    return viewController
  }
}
