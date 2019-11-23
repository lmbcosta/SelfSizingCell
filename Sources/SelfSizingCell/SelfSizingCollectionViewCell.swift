//
//  SelfSizingCollectionViewCell.swift
//  CollectionViewCellSelfSizing
//
//  Created by Luis  Costa on 23/11/2019.
//  Copyright © 2019 Luis  Costa. All rights reserved.
//

#if canImport(UIKit)

import UIKit

open class SelfSizingCollectionViewCell: UICollectionViewCell {
    
    // MARK: Public Properties
    @IBOutlet open weak var widthConstraint: NSLayoutConstraint! {
        didSet { widthConstraint.isActive = false }
    }
    
    open var maxWidth: CGFloat? {
        didSet {
            guard let maxWidth = maxWidth else { return }
            
            if hasXib {
                widthConstraint.constant = maxWidth
                widthConstraint.isActive = true
            }
            else {
                cellWidthConstraint?.constant = maxWidth
                cellWidthConstraint?.isActive = true
            }
        }
    }
    
    // MARK: Private Properties
    private var cellWidthConstraint: NSLayoutConstraint?
    private var hasXib: Bool
    
    // MARK: - Initializers
    public override init(frame: CGRect) {
        hasXib = false
        super.init(frame: frame)
        setupContentViewConstraints()
    }
    
    public required init?(coder: NSCoder) {
        hasXib = true
        super.init(coder: coder)
        setupContentViewConstraints()
    }
}

// MARK: - Private
private extension SelfSizingCollectionViewCell {
    func setupContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupWidthConstraint() {
        cellWidthConstraint = widthAnchor.constraint(equalToConstant: Constants.width)
        cellWidthConstraint?.isActive = false
    }
    
    struct Constants {
        static let width = CGFloat(50)
    }
}

#endif
