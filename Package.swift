// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AMPTracker",
    platforms: [.iOS(.v11), .tvOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AMPTracker",
            targets: [
                "Core"
            ]
        ),
        .library(
            name: "AmplitudeTracker",
            targets: [
                "Core",
                "AmplitudeTracker"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/amplitude/Amplitude-iOS", from: "8.17.1"),
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: []
        ),
        .target(
            name: "AmplitudeTracker",
            dependencies: [
                .product(name: "Amplitude", package: "Amplitude-iOS")
            ],
            path: "Sources/Amplitude"
        )
    ]
)
