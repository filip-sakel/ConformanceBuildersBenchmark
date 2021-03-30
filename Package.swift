// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let optimizationFlags: [SwiftSetting] = [
    .unsafeFlags(["-cross-module-optimization", "-O"])
]

let package = Package(
    name: "ConformanceBuildersBenchmark",
    products: [
        .library(
            name: "BenchmarkedTypes",
            targets: ["BenchmarkedTypes"]
        ),
        .executable(
            name: "BenchmarksMain",
            targets: ["BenchmarksMain"]
        ),
    ],
    dependencies: [
        .package(
            name: "Benchmark",
            url: "https://github.com/google/swift-benchmark",
            from: "0.1.0"
        ),
    ],
    targets: [
//        .executableTarget(
//            name: "BenchmarksMain"
//        ),
        .target(
            name: "BenchmarkedTypes",
            dependencies: [],
            swiftSettings: optimizationFlags
        ),
        .executableTarget(
            name: "BenchmarksMain",
            dependencies: [
                "BenchmarkedTypes",
                "Benchmark",
            ],
            swiftSettings: optimizationFlags
        ),
    ]
)
