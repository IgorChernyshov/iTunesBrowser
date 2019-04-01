//
//  AppReleaseNotesViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Igor Chernyshov on 01/04/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class AppReleaseNotesViewController: UIViewController {
  
  // MARK: - Views
  
  private(set) lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.text = "Что нового"
    return label
  }()
  
  private(set) lazy var versionNumberLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    label.font = UIFont.systemFont(ofSize: 14)
    return label
  }()
  
  private(set) lazy var releaseNotesLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 14)
    label.numberOfLines = 0
    return label
  }()
  
  private(set) lazy var versionHistoryButtonMock: UIButton = {
    let button = UIButton(type: .system)
    button.contentHorizontalAlignment = .right
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("История версий", for: .normal)
    return button
  }()
  
  // MARK: - Properties
  
  private let app: ITunesApp
  
  // MARK: - Init
  
  init(app: ITunesApp) {
    self.app = app
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
    fillData()
  }
  
  // MARK: - Private
  private func setupLayout() {
    self.view.addSubview(titleLabel)
    self.view.addSubview(versionNumberLabel)
    self.view.addSubview(versionHistoryButtonMock)
    self.view.addSubview(releaseNotesLabel)
    
    NSLayoutConstraint.activate([
      self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      self.titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 12.0),
      self.titleLabel.heightAnchor.constraint(equalToConstant: 25.0),
      self.titleLabel.widthAnchor.constraint(equalToConstant: 100.0),
      
      self.versionNumberLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
      self.versionNumberLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 12.0),
      self.versionNumberLabel.heightAnchor.constraint(equalToConstant: 25.0),
      
      self.releaseNotesLabel.topAnchor.constraint(equalTo: self.versionNumberLabel.bottomAnchor),
      self.releaseNotesLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 12.0),
      self.releaseNotesLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -12.0),
      self.releaseNotesLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      
      self.versionHistoryButtonMock.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      self.versionHistoryButtonMock.leftAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: 12.0),
      self.versionHistoryButtonMock.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -12.0),
      self.versionHistoryButtonMock.heightAnchor.constraint(equalToConstant: 30.0)
      ])
  }
  
  private func fillData() {
    self.versionNumberLabel.text = "Версия \(app.version ?? "")"
    self.releaseNotesLabel.text = app.releaseNotes
  }
  
}
