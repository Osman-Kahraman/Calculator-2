//
//  CalculatorButton.swift
//  VibingCalculator
//
//  Created by Osman Kahraman on 2026-06-11.
//


import SwiftUI

struct CalculatorButton: View {
    let title: String
    let action: () -> Void
    @State private var isPressed = false

    var body: some View {

        Button {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            action()
        } label: {
            Text(title)
                .font(.title2.bold())
                .frame(
                    maxWidth: .infinity,
                    minHeight: 70
                )
                .background(
                    RoundedRectangle(
                        cornerRadius: 16
                    )
                    .fill(.gray.opacity(isPressed ? 0.3 : 0.2))
                )
                .scaleEffect(isPressed ? 0.98 : 1.0)
                .animation(.spring(response: 0.25, dampingFraction: 0.7), value: isPressed)
        }
        .buttonStyle(.plain)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
        .accessibilityLabel(Text("Button \(title)"))
    }
}
