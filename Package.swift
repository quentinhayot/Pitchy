// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "Pitchy",
  products: [
      .library(name: "Pitchy", targets: ["Pitchy"]),
      .library(name: "Pitchy-Dynamic", type: .dynamic, targets: ["Pitchy"]),
  ]
)
