//
//  DictionaryWithDefault.swift
//
//  Created by : Tomoaki Yagishita on 2023/04/01
//  © 2023  SmallDeskSoftware
//

import Foundation

public struct DictionaryWithDefault<Key: Hashable, Value> {
    var dictionary: [Key: Value]
    var defaultValue: Value

    public var keys: Dictionary<Key, Value>.Keys {
        dictionary.keys
    }
    public var values: Dictionary<Key, Value>.Values {
        dictionary.values
    }
    
    public init(_ dic: [Key: Value] = [:], defaultValue: Value) {
        self.dictionary = dic
        self.defaultValue = defaultValue
    }
    public subscript(key: Key) -> Value {
        get {
            dictionary[key, default: defaultValue]
        }
        set(newValue) {
            dictionary[key] = newValue
        }
    }
}
