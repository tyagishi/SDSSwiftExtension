//
//  Test.swift
//  SDSSwiftExtension
//
//  Created by Tomoaki Yagishita on 2026/05/07.
//

import Testing
import AsyncAlgorithms

actor MyActor {
    var myActorValue: Int
    init(_ value: Int) { myActorValue = value }
}

struct Test {
    @available(macOS 15, *)
    @Test func array_AsyncStream() async throws {
        let actor1 = MyActor(1)
        let actor2 = MyActor(2)
        let actor3 = MyActor(3)
        
        // Errors
//        let values1 = [actor2, actor1, actor3].map({ $0.myActorValue })
//        let values2 = [actor2, actor1, actor3].map({ await $0.myActorValue })
        var values0: [Int] = []
        for actor in [actor2, actor1, actor3] {
            values0.append(await actor.myActorValue)
        }

        let values4 = [actor2, actor1, actor3].async.map({ await $0.myActorValue })
    }
}
