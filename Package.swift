// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "random-swift",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_15), .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "random-swift",
            targets: ["random-swift"])
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "random-swift",
            path: "Sources",
            sources: ["Classes"],
            resources: [
                .process("Sources/Assets/words.txt"),
            ]
        ),
        .testTarget(
            name: "random-swift_Tests",
            dependencies: ["random-swift"],
            path: "Example/Tests",
            sources: ["Sources"]
        )
    ]
)
