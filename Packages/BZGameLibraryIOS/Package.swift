// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BZGameLibraryIOS",
  platforms: [.iOS(.v17)],
  products: [
    .library(
      name: "BZGameLibraryIOS",
      targets: ["BZGameLibraryIOS"]
    ),
  ],
  dependencies: [
    .package(path: "BZGameLibraryKit")
  ],
  targets: [
    .target(
      name: "BZGameLibraryIOS",
      dependencies: ["BZGameLibraryKit"]
    ),
    .testTarget(
      name: "BZGameLibraryIOSTests",
      dependencies: ["BZGameLibraryIOS"]
    ),
  ]
)
