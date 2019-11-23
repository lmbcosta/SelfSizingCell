# SelfSizingCell

Enables collection view cells, dynamically, adjust their size based on their content

## Requirements
* Xcode 11
* Swift 5.1

## Installation

These are currently the suported options:

### [Swift Package Manager](https://github.com/apple/swift-package-manager )

Create a `Package.swift` file.

```
// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "SelfSizingCell",
  dependencies: [
    .package(url: "https://github.com/lmbcosta/SelfSizingCell", from: "5.1.0")
  ],
  targets: [
    .target(name: "SelfSizingCell", dependencies: [])
  ]
)
````

```bash
$ swift build
```
Alternatevely, in your Xcode: Go to File > Swift Packages > Add Pachage Dependency

## Author
Luís Costa - lmbcosta@hotmail.com<br/>

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/lmbcosta/SelfSizingCell/blob/master/LICENSE) file for details

