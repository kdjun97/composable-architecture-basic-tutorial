//
//  CounterFeature.swift
//  ComposableArchitectureTutorial
//
//  Created by 김동준 on 1/21/24
//

import Foundation
import ComposableArchitecture

@Reducer
struct CounterFeature {
    struct State: Equatable {
        var counter: Int = 0
    }
    
    enum Action {
        case minusButtonTapped
        case plusButtonTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch (action) {
            case .minusButtonTapped:
                state.counter -= 1
                return .none
            case .plusButtonTapped:
                state.counter += 1
                return .none
            }
        }
    }
}
