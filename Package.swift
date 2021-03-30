// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let optimizationFlags: [SwiftSetting] = [
    .unsafeFlags(["-cross-module-optimization", "-O"])
]

let package = Package(
    name: "ConformanceBuildersBenchmark",
    products: [
//        .library(
//            name: "Benchmarks",
//            targets: ["Benchmarks"]
//        ),
    ],
    dependencies: [
        .package(
            name: "Benchmark",
            url: "https://github.com/google/swift-benchmark",
            from: "0.1.0"
        ),
    ],
    targets: [
        .target(
            name: "BenchmarkedTypes",
            dependencies: [],
            swiftSettings: optimizationFlags
        ),
        .target(
            name: "Benchmarks",
            dependencies: [
                "Benchmark",
            ],
            swiftSettings: optimizationFlags
        ),
        .testTarget(
            name: "BenchmarksMain",
            dependencies: ["Benchmarks", "BenchmarkedTypes"],
            swiftSettings: optimizationFlags
        ),
    ]
)
