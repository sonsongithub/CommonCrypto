import PackageDescription

let package = Package(
    name: "CommonCrypto",
    targets: [
        Target(name: "CommonCrypto", dependencies: ["CCommonCrypto"]),
        Target(name: "CCommonCrypto")
    ]
)
