// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdstirSDKMediationAdapterIronSource",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "AdstirAdsMediationAdapterIronSource",
            targets: ["AdstirAdsMediationAdapterIronSourceTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/united-adstir/adstirsdk-swift-package.git",
            exact: "2.17.8"
        ),
        .package(
            url: "https://github.com/ironsource-mobile/LevelPlay-Swift-Package.git",
            exact: "9.4.1"
        ),
    ],
    targets: [
        .target(
            name: "AdstirAdsMediationAdapterIronSourceTarget",
            dependencies: [
                .target(name: "IronSourceAdapter"),
                .product(name: "UnityMediationSDK", package: "LevelPlay-Swift-Package"),
                .product(name: "AdstirAds", package: "adstirsdk-swift-package"),
            ],
            path: "Sources/AdstirSDKMediationAdapterIronSource-Swift-Package"
        ),
        .binaryTarget(
            name: "IronSourceAdapter",
            url: "https://dl.ad-stir.com/sdk/spm/2.17.8/AdstirAdsMediationAdapterIronSource.xcframework.zip",
            checksum: "4104fdab298732ffa35a52ccab38405fbb19ab6164c17f1f581b949ae0299589"
        ),
    ]
)
