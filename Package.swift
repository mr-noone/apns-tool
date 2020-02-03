// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "apns",
  products: [
    .executable(name: "apns", targets: ["apns"])
  ],
  dependencies: [
    .package(url: "https://github.com/PerfectlySoft/Perfect-Notifications.git", from: "3.0.0"),
    .package(url: "https://github.com/kylef/Commander.git", from: "0.9.1")
  ],
  targets: [
    .target(name: "apns", dependencies: ["PerfectNotifications", "Commander"])
  ]
)
