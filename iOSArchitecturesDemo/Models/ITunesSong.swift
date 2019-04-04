//
//  ITunesSong.swift
//  iOSArchitecturesDemo
//
//  Created by Igor Chernyshov on 02.04.2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

public struct ITunesSong: Codable {
  
  public var trackName: String
  public var artistName: String?
  public var collectionName: String?
  public var artistViewUrl: String?
  public var artwork: String?
  
  // MARK: - Codable
  
  private enum CodingKeys: String, CodingKey {
    case trackName = "trackName"
    case artistName = "artistName"
    case collectionName = "collectionName"
    case artistViewUrl = "artistViewUrl"
    case artwork = "artworkUrl100"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.trackName = try container.decode(String.self, forKey: .trackName)
    self.artistName = try? container.decode(String.self, forKey: .artistName)
    self.collectionName = try? container.decode(String.self, forKey: .collectionName)
    self.artistViewUrl = try? container.decode(String.self, forKey: .artistViewUrl)
    self.artwork = try? container.decode(String.self, forKey: .artwork)
  }
  
  // MARK: - Init
  
  internal init(trackName: String,
                artistName: String?,
                collectionName: String?,
                artistViewUrl: String?,
                artwork: String?) {
    self.trackName = trackName
    self.artistName = artistName
    self.collectionName = collectionName
    self.artistViewUrl = artistViewUrl
    self.artwork = artwork
  }
}
