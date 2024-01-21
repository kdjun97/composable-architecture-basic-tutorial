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
        var isLoading: Bool = false
        var fact: String? = nil
        var isTimerStarted: Bool = false
    }
    
    enum Action {
        case minusButtonTapped
        case plusButtonTapped
        case factButtonTapped
        case factResponse(String)
        case timerButtonTapped
        case timerTick
    }
    
    enum CancelID {
        case timer
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch (action) {
            case .minusButtonTapped:
                state.counter -= 1
                state.fact = nil
                return .none
            case .plusButtonTapped:
                state.counter += 1
                state.fact = nil
                return .none
            case .factButtonTapped:
                state.fact = nil
                state.isLoading = true
                
                return .run { [counter = state.counter] send in
                    do {
                        let (data, _) = try await URLSession.shared
                            .data(from: URL(string: "http://numbersapi.com/\(counter)")!)
                        let fact = String(decoding: data, as: UTF8.self)
                        await send(.factResponse(fact))
                    } catch let error {
                        await send(.factResponse(error.localizedDescription))
                    }
                }
            case .factResponse(let count):
                state.fact = count
                state.isLoading = false
                return .none
            case .timerButtonTapped:
                state.isTimerStarted.toggle()
                if state.isTimerStarted {
                    return .run { send in
                        repeat {
                            try await Task.sleep(for: .seconds(1))
                            await send(.timerTick)
                        } while true
                    }.cancellable(id: CancelID.timer)
                } else {
                    return .cancel(id: CancelID.timer)
                }
            case .timerTick:
                state.counter += 1
                return .none
            }
        }
    }
}
