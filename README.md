# SelfSizingCell ▪️ 📐 🔳

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

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/lmbcosta/SelfSizingCell/blob/master/LICENSE) file for details

