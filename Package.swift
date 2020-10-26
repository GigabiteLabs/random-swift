// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "random-swift",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "random-swift",
            targets: ["random-swift"])
    ],
    targets: [
        .target(
            name: "random-swift",
            resources: [
                .process("Resources/words.txt"),
            ],
            swiftSettings: [
               .define("SPM")
            ]
        ),
        .testTarget(
            name: "random-swift-tests",
            dependencies: ["random-swift"],
            path: "Projects/CocoapodsExample/random-swift-ExampleTests/Sources",
            swiftSettings: [
               .define("SPMTEST")
            ]
        )
    ]
)


