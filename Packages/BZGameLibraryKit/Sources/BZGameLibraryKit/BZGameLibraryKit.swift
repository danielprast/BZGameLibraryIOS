// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation
import BZUtil


public struct BZGameLibraryKitModule {

  public init() {}

  public var moduleName: String {
    let name = "\(Self.self)"
    tlog("module name", name)
    return name
  }

}
