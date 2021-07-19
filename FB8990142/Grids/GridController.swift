//  Copyright © 2020 Keith Harrison. All rights reserved.
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
import Shared

final class GridController: UIViewController {
    var gridColumns: Int = 1 {
        didSet {
            gridView.columnCount = gridColumns
        }
    }

    var gridRows: Int = 1 {
        didSet {
            gridView.rowCount = gridRows
        }
    }
    
    var gridWidth: CGFloat = 1.0 {
        didSet {
            gridView.lineWidth = gridWidth
        }
    }
    
    var gridColor: UIColor = .red {
        didSet {
            gridView.lineColor = gridColor
        }
    }

    private lazy var gridView: GridView = {
        let gridView = GridView()
        gridView.translatesAutoresizingMaskIntoConstraints = false
        gridView.backgroundColor = .clear
        gridView.columnCount = gridColumns
        gridView.rowCount = 1
        gridView.lineColor = .red
        gridView.lineWidth = 1
        return gridView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(gridView)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: gridView.leadingAnchor),
            view.topAnchor.constraint(equalTo: gridView.topAnchor),
            view.trailingAnchor.constraint(equalTo: gridView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: gridView.bottomAnchor)
        ])
    }
}
