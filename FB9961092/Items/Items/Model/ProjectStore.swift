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
import Combine

final class ProjectStore: ObservableObject {
    @Published var projects: [Project] = []
    @Published var error: Error?
    
    init(_ projects: [Project] = []) {
        if projects.isEmpty {
            self.projects = load()
        } else {
            self.projects = projects
        }
    }
    
    func newProject() {
        let time = Date().formatted(date: .abbreviated, time: .complete)
        let project = Project(id: UUID(), name: "New Project", description: time, items: [])
        projects.append(project)
        save()
    }
    
    func updateProject(_ project: UUID, name: String) {
        if let index = index(for: project) {
            projects[index].name = name
            save()
        }
    }
    
    func deleteProjects(at offsets: IndexSet) {
        projects.remove(atOffsets: offsets)
        save()
    }
    
    func newItem(in project: UUID) {
        if let index = index(for: project) {
            let item = Item(id: UUID(), name: "New item", note: "Note", project: project)
            projects[index].items.append(item)
            save()
        }
    }
    
    func deleteItems(in project: Project, at offsets: IndexSet) {
        if let index = index(for: project.id) {
            projects[index].items.remove(atOffsets: offsets)
            save()
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(projects)
            try data.write(to: ProjectStore.defaultStore())
        } catch {
            self.error = error
        }
    }

    private func index(for project: UUID) -> Int? {
        projects.firstIndex { $0.id == project }
    }
    
    private func index(for item: Item) -> Int? {
        if let index = index(for: item.id) {
            return projects[index].items.firstIndex { $0.id == item.id }
        }
        return nil
    }
    
    func load() -> [Project] {
        var projects: [Project] = []
        if let data = try? Data(contentsOf: ProjectStore.defaultStore()) {
            do {
                projects = try JSONDecoder().decode([Project].self, from: data)
            } catch {
                self.error = error
            }
        }
        return projects
    }
    
    private static func defaultStore() throws -> URL {
        let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return url.appendingPathComponent("Project.json", isDirectory: false)
    }
}
