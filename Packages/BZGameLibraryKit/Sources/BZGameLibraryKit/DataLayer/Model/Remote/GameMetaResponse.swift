//
//  GameMetaResponse.swift
//  BZGameLibraryKit
//
//  Created by Daniel Prastiwa on 08/08/25.
//

import Foundation


public struct GameMetaResponse: Codable {

  public let id: Int
  public let slug, name: String
  public let added: Int

  public init(
    id: Int,
    slug: String,
    name: String,
    added: Int
  ) {
    self.id = id
    self.slug = slug
    self.name = name
    self.added = added
  }

  public init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
    self.slug = try container.decodeIfPresent(String.self, forKey: .slug) ?? ""
    self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    self.added = try container.decodeIfPresent(Int.self, forKey: .added) ?? 0
  }
}
