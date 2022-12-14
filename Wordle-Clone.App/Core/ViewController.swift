//
//  ViewController.swift
//  Wordle-Clone.App
//
//  Created by Дмитрий Скворцов on 26.11.2022.
//

import UIKit

class ViewController: UIViewController {

    let answers = [
    "later",
    "block",
    "broad",
    "there",
    "ultra"
    ]

    var answer = ""

    private var guesses: [[Character?]] = Array(
        repeating: Array(repeating: nil, count: 5),
        count: 6
    )

    let keyboardVC = KeyboardViewController()
    let boardVC = BoardViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        addChildren()
        answer = answers.randomElement() ?? "after"
    }

    private func addChildren() {
        addChild(keyboardVC)
        keyboardVC.didMove(toParent: self)
        keyboardVC.delegate = self
        keyboardVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyboardVC.view)

        addChild(boardVC)
        boardVC.didMove(toParent: self)
        boardVC.view.translatesAutoresizingMaskIntoConstraints = false
        boardVC.dataSource = self
        view.addSubview(boardVC.view)

        addConstraints()
    }

    private func addConstraints() {

        let boardVCConstraints = [
            boardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            boardVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            boardVC.view.bottomAnchor.constraint(equalTo: keyboardVC.view.topAnchor),
            boardVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ]

        let keyboardVCConstraints = [
            keyboardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ]

        NSLayoutConstraint.activate(keyboardVCConstraints)
        NSLayoutConstraint.activate(boardVCConstraints)

    }

}

extension ViewController: BoardViewControllerDataSource {
    func boxColor(at indexPath: IndexPath) -> UIColor? {
        let rowIndex = indexPath.section
        let count = guesses[rowIndex].compactMap({ $0 }).count
        guard count == 5 else { return nil }

        let indexedAnswer = Array(answer)
        guard let letter = guesses[indexPath.section][indexPath.row],
              indexedAnswer.contains(letter) else { return nil }

        if indexedAnswer[indexPath.row] == letter {
            return .systemGreen
        }

        return .systemOrange
    }

    var currentGuesses: [[Character?]] {
        return guesses
    }

}

extension ViewController: KeyboardViewControllerDelegate {
    func keyboardViewController(_ viewController: KeyboardViewController, didTapKey letter: Character) {
        var stop = false
        for i in 0..<guesses.count {
            for j in 0..<guesses[i].count {
                if guesses[i][j] == nil {
                    guesses[i][j] = letter
                    stop = true
                    break
                }
            }
            if stop {
                break
            }
        }
        boardVC.reloadData()
    }

}
