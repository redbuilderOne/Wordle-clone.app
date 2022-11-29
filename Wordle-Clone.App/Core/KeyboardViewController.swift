//
//  KeyboardViewController.swift
//  Wordle-Clone.App
//
//  Created by Дмитрий Скворцов on 26.11.2022.
//

import UIKit

class KeyboardViewController: UIViewController {

    let letters = ["qwertyuiop", "asdfghjkl", "zxcvbnm"]
    var keys: [[Character]] = []

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .green
        collectionView.register(KeyCollectionViewCell.self, forCellWithReuseIdentifier: KeyCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self

        view.backgroundColor = .red
        activateConstraints()
        appendCharacters()
    }

    private func appendCharacters() {
        for row in letters {
            let characters = Array(row)
            keys.append(characters)
        }
    }

    private func activateConstraints() {
        let collectionViewConstraints = [
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]

        NSLayoutConstraint.activate(collectionViewConstraints)
    }

}

extension KeyboardViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return keys.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keys[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyCollectionViewCell.identifier, for: indexPath) as? KeyCollectionViewCell else { fatalError() }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 50, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }

}
