//
//  HomView.swift
//  Restart
//
//  Created by Sreysros Leak on 12/6/24.
//

import SwiftUI

struct HomView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
//            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(Animation.easeInOut(duration: 4)
                        .repeatForever(), value: isAnimating)
            }
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .foregroundColor(.secondary)
                .font(.system(size: 16, weight: .medium))
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .foregroundColor(.white)
                Text("Restart")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
            })
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
        } // VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

#Preview {
    HomView()
}
