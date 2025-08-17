// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BZGameLibraryKit",
  platforms: [
    .iOS(.v17),
    .macOS(.v14)
  ],
  products: [
    .library(
      name: "BZGameLibraryKit",
      targets: ["BZGameLibraryKit"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/danielprast/BezetQit.git",
      from: Version("1.0.0")
    )
  ],
  targets: [
    .target(
      name: "BZGameLibraryKit",
      dependencies: [
        .product(name: "BZConnectionChecker", package: "BezetQit"),
        .product(name: "BZUtil", package: "BezetQit")
      ],
      resources: [
        .process("Resources")
      ]
    ),
    .testTarget(
      name: "BZGameLibraryKitTests",
      dependencies: ["BZGameLibraryKit"]
    ),
  ]
)
