# SelfSizingCell ▪️ 📐 🔳

Enables collection view cells adjusting dynamically their size based on their content

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
Alternatively, in your Xcode: Go to File > Swift Packages > Add Pachage Dependency

### Usage
This Package supports both configurations: Xib's and Code.<br/>
In both cases you need to extend `SelfSizingCollectionViewCell` for your `UICollectionViewCell` and `BaseCollectionView` for you `UICollectionView`.<br/>

```swift
class MyCollectionView: BaseCollectionView { ... }

class MyCollectionViewCell: SelfSizingCollectionViewCell { ... }
```

On your `UICollectionViewDataSource` set cell's max width

```swift
class MyViewController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        cell.maxWidth = collectionView.bounds.width
        
        return cell
    }
}
```
Just remember, you have to think about your Auto Layout knowing that cell's view width will be constrained to `var maxWidth` value.

* #### Xib
    Your constraints in your `UICollectionViewCell` must be well applied. If you have conficts between constraints this will not work.</br>

    1. On your `UICollectionView.xib` connect your `UICollectionViewFlowLayout` into 

        ```
        class BaseCollectionView: UICollectionView {
          @IBOutlet open weak var layout: UICollectionViewFlowLayout!
        }
        ```

    2. On your  `UICollectionViewCell.xib` create a width constraint for your view and connect it into 

        ```
        open class SelfSizingCollectionViewCell: UICollectionViewCell {
          @IBOutlet open weak var widthConstraint: NSLayoutConstraint!
        }
        ```
* #### Code
    You dont need to do anything. SelfSizingCell handles it for you😎

## Author
Luís Costa - lmbcosta@hotmail.com<br/>

## References
* [Vadim Bulavin](https://twitter.com/V8tr) - [Collection View Cells Self-Sizing: Step by Step Tutorial](https://www.vadimbulavin.com/collection-view-cells-self-sizing/)
* [Alan Wang](https://engineering.shopspring.com/@alanwang100) - [Dynamic Cell Sizing in UICollectionView](https://engineering.shopspring.com/dynamic-cell-sizing-in-uicollectionview-fd95f614ef80)

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/lmbcosta/SelfSizingCell/blob/master/LICENSE) file for details

