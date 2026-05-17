// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Bench",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "Bench",
            path: "Sources"
        ),
        .testTarget(
            name: "BenchTests",
            dependencies: ["Bench"],
            path: "Tests/BenchTests"
        )
    ]
)
