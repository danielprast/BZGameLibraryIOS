//
//  PublishersResponse.swift
//  BZGameLibraryKit
//
//  Created by Daniel Prastiwa on 08/08/25.
//

import Foundation


public struct PublishersResponse: Codable {
  public let count: Int
  public let next: String
  public let previous: String
  public let results: [ResultItem]

  public init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.count = try container.decodeIfPresent(Int.self, forKey: .count) ?? 0
    self.next = try container.decodeIfPresent(String.self, forKey: .next) ?? ""
    self.previous = try container.decodeIfPresent(String.self, forKey: .previous) ?? ""
    self.results = try container.decodeIfPresent([ResultItem].self, forKey: .results) ?? []
  }

  public init(
    count: Int,
    next: String,
    previous: String,
    results: [ResultItem]
  ) {
    self.count = count
    self.next = next
    self.previous = previous
    self.results = results
  }

  public static func makeEmpty() -> PublishersResponse {
    .init(
      count: 0,
      next: "",
      previous: "",
      results: []
    )
  }

  // MARK: - •

  public struct ResultItem: Codable {
    public let id: Int
    public let name, slug: String
    public let gamesCount: Int
    public let imageBackground: String
    public let games: [GameMetaResponse]

    public enum CodingKeys: String, CodingKey {
      case id, name, slug
      case gamesCount = "games_count"
      case imageBackground = "image_background"
      case games
    }

    public init(from decoder: any Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
      self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
      self.slug = try container.decodeIfPresent(String.self, forKey: .slug) ?? ""
      self.gamesCount = try container.decodeIfPresent(Int.self, forKey: .gamesCount) ?? 0
      self.imageBackground = try container.decodeIfPresent(String.self, forKey: .imageBackground) ?? ""
      self.games = try container.decodeIfPresent([GameMetaResponse].self, forKey: .games) ?? []
    }

    public init(
      id: Int,
      name: String,
      slug: String,
      gamesCount: Int,
      imageBackground: String,
      games: [GameMetaResponse]
    ) {
      self.id = id
      self.name = name
      self.slug = slug
      self.gamesCount = gamesCount
      self.imageBackground = imageBackground
      self.games = games
    }

    public static func makeEmpty() -> ResultItem {
      .init(
        id: 0,
        name: "",
        slug: "",
        gamesCount: 0,
        imageBackground: "",
        games: []
      )
    }
  }
}
