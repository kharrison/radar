//  Copyright © 2021 Keith Harrison. All rights reserved.
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

import Foundation

public struct Country: Equatable, Identifiable {
    public var id: Int
    public var name: String
    public var capital: String?
    public var continent: String
    public var currency: String?
    public var area: Double
    public var north: Double
    public var south: Double
    public var east: Double
    public var west: Double
    public var population: Int
    public var visited: Bool

    public var formattedPopulation: String {
        NumberFormatter.localizedString(from: population as NSNumber, number: .decimal)
    }

    public var formattedArea: String {
        NumberFormatter.localizedString(from: area as NSNumber, number: .decimal)
    }

    public init(id: Int = 0, name: String, capital: String? = nil, continent: String, currency: String? = nil, area: Double = 0, north: Double = 0, south: Double = 0, east: Double = 0, west: Double = 0, population: Int = 0, visited: Bool = false) {
        self.id = id
        self.name = name
        self.capital = capital
        self.continent = continent
        self.currency = currency
        self.area = area
        self.north = north
        self.south = south
        self.east = east
        self.west = west
        self.population = population
        self.visited = visited
    }
}
