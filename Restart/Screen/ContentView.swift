//
//  ContentView.swift
//  Restart
//
//  Created by Sreysros Leak on 11/6/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
