// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode",
    defaultLocalization: "en",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "AdventOfCode", targets: ["AdventOfCode"]),
        .library(name: "AdventOfCode2024", targets: ["AdventOfCode2024"]),
        .library(name: "AdventOfCode2025", targets: ["AdventOfCode2025"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Kamaalio/KamaalSwift.git", .upToNextMajor(from: "3.5.0")),
    ],
    targets: [
        .target(
            name: "AdventOfCode",
            dependencies: [
                .product(name: "KamaalExtensions", package: "KamaalSwift"),
            ]
        ),
        .testTarget(name: "AdventOfCodeTests", dependencies: ["AdventOfCode"]),
        .target(
            name: "AdventOfCode2024",
            dependencies: ["AdventOfCode"],
            resources: [.process("Input")]
        ),
        .testTarget(name: "AdventOfCode2024Tests", dependencies: ["AdventOfCode2024"]),
        .target(
            name: "AdventOfCode2025",
            dependencies: [
                .product(name: "KamaalExtensions", package: "KamaalSwift"),
                "AdventOfCode",
            ],
            resources: [.process("Input")]
        ),
        .testTarget(
            name: "AdventOfCode2025Tests",
            dependencies: [
                "AdventOfCode",
                "AdventOfCode2025",
            ]),
    ]
)
