//
//  PlatformsResponse.swift
//  BZGameLibraryKit
//
//  Created by Daniel Prastiwa on 08/08/25.
//

import Foundation


public struct PlatformsResponse: Codable {
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

  public static func makeEmpty() -> PlatformsResponse {
    .init(
      count: 0,
      next: "",
      previous: "",
      results: []
    )
  }

  // MARK: - • Result
  public struct ResultItem: Codable {
    public let id: Int
    public let name, slug: String
    public let gamesCount: Int
    public let imageBackground: String
    public let image: String
    public let yearStart: Int
    public let yearEnd: Int
    public let games: [GameMetaResponse]

    public enum CodingKeys: String, CodingKey {
      case id, name, slug
      case gamesCount = "games_count"
      case imageBackground = "image_background"
      case image
      case yearStart = "year_start"
      case yearEnd = "year_end"
      case games
    }

    public init(from decoder: any Decoder) throws {
      let container: KeyedDecodingContainer<PlatformsResponse.ResultItem.CodingKeys> = try decoder.container(keyedBy: PlatformsResponse.ResultItem.CodingKeys.self)
      self.id = try container.decodeIfPresent(Int.self, forKey: PlatformsResponse.ResultItem.CodingKeys.id) ?? 0
      self.name = try container.decodeIfPresent(String.self, forKey: PlatformsResponse.ResultItem.CodingKeys.name) ?? ""
      self.slug = try container.decodeIfPresent(String.self, forKey: PlatformsResponse.ResultItem.CodingKeys.slug) ?? ""
      self.gamesCount = try container.decodeIfPresent(Int.self, forKey: PlatformsResponse.ResultItem.CodingKeys.gamesCount) ?? 0
      self.imageBackground = try container.decodeIfPresent(String.self, forKey: PlatformsResponse.ResultItem.CodingKeys.imageBackground) ?? ""
      self.image = try container.decodeIfPresent(String.self, forKey: PlatformsResponse.ResultItem.CodingKeys.image) ?? ""
      self.yearStart = try container.decodeIfPresent(Int.self, forKey: PlatformsResponse.ResultItem.CodingKeys.yearStart) ?? 0
      self.yearEnd = try container.decodeIfPresent(Int.self, forKey: PlatformsResponse.ResultItem.CodingKeys.yearEnd) ?? 0
      self.games = try container.decodeIfPresent([GameMetaResponse].self, forKey: PlatformsResponse.ResultItem.CodingKeys.games) ?? []
    }

    public init(
      id: Int,
      name: String,
      slug: String,
      gamesCount: Int,
      imageBackground: String,
      image: String,
      yearStart: Int,
      yearEnd: Int,
      games: [GameMetaResponse]
    ) {
      self.id = id
      self.name = name
      self.slug = slug
      self.gamesCount = gamesCount
      self.imageBackground = imageBackground
      self.image = image
      self.yearStart = yearStart
      self.yearEnd = yearEnd
      self.games = games
    }

    public static func makeEmpty() -> PlatformsResponse.ResultItem {
      return .init(
        id: 0,
        name: "",
        slug: "",
        gamesCount: 0,
        imageBackground: "",
        image: "",
        yearStart: 0,
        yearEnd: 0,
        games: []
      )
    }
  }
}
