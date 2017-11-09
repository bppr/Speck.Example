// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "SpeckExample",
  products: [],
  dependencies: [
    .package(url: "../Speck", from: "0.1.0"),
    // .package(url: "https://github.com/bppr/Speck", from: "0.1.0"),
  ],
  targets: [
    .target(name: "Example", dependencies: ["Speck"])
  ]
)
