//
//  AppFeature.swift
//  ComposableArchitectureTutorial
//
//  Created by 김동준 on 1/21/24
//

import Foundation
import ComposableArchitecture
import SwiftUI

@Reducer
struct AppFeature {
    struct State {
        var tab1 = CounterFeature.State()
        var tab2 = CounterFeature.State()
    }
    
    enum Action {
        case tab1(CounterFeature.Action)
        case tab2(CounterFeature.Action)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: \.tab1, action: \.tab1) {
            CounterFeature()
                ._printChanges()
        }
        Scope(state: \.tab2, action: \.tab2) {
            CounterFeature()
                ._printChanges()
        }
        Reduce { state, action in
            // 코어 로직
            return .none
        }
    }
}
