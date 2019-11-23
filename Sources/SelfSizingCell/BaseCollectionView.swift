//
//  BaseCollectionView.swift
//  CollectionViewCellSelfSizing
//
//  Created by Luis  Costa on 23/11/2019.
//  Copyright © 2019 Luis  Costa. All rights reserved.
//

#if canImport(UIKit)

import UIKit

open class BaseCollectionView: UICollectionView {
    // MARK: - Properties
    @IBOutlet open weak var layout: UICollectionViewFlowLayout! {
        didSet { layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize }
    }
    
    // MARK: Initializers
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        if let collectionViewFlowLayout = layout as? UICollectionViewFlowLayout {
            collectionViewFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#endif

