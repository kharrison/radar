//  Copyright © 2022 Keith Harrison. All rights reserved.
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

import Combine
import Foundation

public class ItemStore: ObservableObject {
    @Published public var items: [Item] = []

    public static let shared: ItemStore = .init()

    private init() {
        items = initialItems
    }
    
    public var itemCount: Int {
        items.count
    }
    
    @discardableResult
    public func newItem() -> Item {
        let item = Item(name: "New Item")
        items.append(item)
        return item
    }
    
    public func item(with id: Item.ID) -> Item? {
        items.first(where: { $0.id == id })
    }
    
    public func lastItemID() -> Item.ID? {
        items.last?.id
    }
    
    public func deleteItems(_ offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

private let initialItems: [Item] = {
    [
        Item(name: "Red"),
        Item(name: "Orange"),
        Item(name: "Yellow"),
        Item(name: "Green"),
        Item(name: "Blue"),
        Item(name: "Indigo"),
        Item(name: "Violet")
    ]
}()
