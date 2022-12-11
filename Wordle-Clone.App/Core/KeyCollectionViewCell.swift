//
//  KeyCollectionViewCell.swift
//  Wordle-Clone.App
//
//  Created by Дмитрий Скворцов on 29.11.2022.
//

import UIKit

class KeyCollectionViewCell: UICollectionViewCell {
    static let identifier = "KeyCollectionViewCell"

    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        contentView.addSubview(label)
        activateConstraints()
    }

    private func activateConstraints() {
        let labelConstraints = [
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]

        NSLayoutConstraint.activate(labelConstraints)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }

    func configure(with letter: Character) {
        label.text = String(letter).uppercased()
    }

}
