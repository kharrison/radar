//
//  ViewController.swift
//  FirstBaseline
//
//  Created by Keith Harrison https://useyourloaf.com
//  Copyright (c) 2017 Keith Harrison. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright
//  notice, this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright
//  notice, this list of conditions and the following disclaimer in the
//  documentation and/or other materials provided with the distribution.
//
//  3. Neither the name of the copyright holder nor the names of its
//  contributors may be used to endorse or promote products derived from
//  this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.

import UIKit

class ViewController: UIViewController {
    let fontSize: CGFloat = 28.0
    let spacing: CGFloat = 8.0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        // Create a horizontal stack view with three text labels.
        // The second text label has a font size twice that of the
        // other two labels making it the tallest of the three labels

        let label1 = simpleLabel(title: "Hello", fontSize: fontSize)
        let label2 = simpleLabel(title: "Ciao", fontSize: fontSize * 2)
        let label3 = simpleLabel(title: "Hola", fontSize: fontSize)
        let stackView = UIStackView(arrangedSubviews: [label1, label2, label3])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = spacing

        // Use a first baseline alignment. The height of the stack view
        // should be set to the height of the label with the tallest
        // intrinsic content size (label2).
        stackView.alignment = .firstBaseline
        view.addSubview(stackView)

        // Add a yellow background to the stack view so we can more
        // easily see its frame
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        stackView.insertSubview(yellowView, at: 0)
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: stackView.topAnchor),
            yellowView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            yellowView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            yellowView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])

        // Position stack view so that it is centered and below the top
        // layout guide.
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: spacing),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Add constraints for all but the first labels to make sure the
        // stack view canvas is at least as big as the  biggest text label.
        // This is required when we use first or last baseline for the
        // stack view alignment.

        // This would appear to be a bug. The stack view height is set
        // based on the first label. It does not allow for one of the
        // other views being higher.

        // Without these constraint the bounds for label2 are outside the
        // frame of the stack view causing it to underlap the top layout
        // guide.

        // Uncomment to fix the issue
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(lessThanOrEqualTo: label2.topAnchor),
//            stackView.topAnchor.constraint(lessThanOrEqualTo: label3.topAnchor)
//        ])
    }

    private func simpleLabel(title: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.backgroundColor = .green
        return label
    }
}
