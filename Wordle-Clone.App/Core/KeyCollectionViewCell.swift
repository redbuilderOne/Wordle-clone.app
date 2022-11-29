//
//  KeyCollectionViewCell.swift
//  Wordle-Clone.App
//
//  Created by Дмитрий Скворцов on 29.11.2022.
//

import UIKit

class KeyCollectionViewCell: UICollectionViewCell {
    static let identifier = "KeyCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
