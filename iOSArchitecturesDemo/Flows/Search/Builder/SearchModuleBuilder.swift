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
        let presenter = SearchPresenter()
        let viewController = SearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
