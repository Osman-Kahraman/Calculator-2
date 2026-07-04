//
//  CalculatorButton.swift
//  Calculator-2
//
//  Created by Osman Kahraman on 2026-06-11.
//


import SwiftUI

struct CalculatorButton: View {
    let title: String
    let action: () -> Void
    @State private var isPressed = false

    private var isCalculationKey: Bool {
        ["/", "*", "-", "+", "="].contains(title)
    }

    private var isEqualsKey: Bool {
        title == "="
    }
    
    private var isReturnKey: Bool {
        title == "⌫"
    }
    
    private var isClearKey: Bool {
        title == "C"
    }

    private var backgroundColor: LinearGradient {
        if isEqualsKey {
            return LinearGradient(
                colors: [
                    Color(red: 0.95, green: 0.75, blue: 0.45),
                    Color(red: 0.75, green: 0.55, blue: 0.20)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }

        if isCalculationKey {
            return LinearGradient(
                colors: [
                    Color(red: 0.45, green: 0.28, blue: 0.15),
                    Color(red: 0.25, green: 0.12, blue: 0.05)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        
        if isReturnKey {
            return LinearGradient(
                colors: [
                    Color(red: 0.45, green: 0.10, blue: 0.10),
                    Color(red: 0.25, green: 0.05, blue: 0.05)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        
        if isClearKey {
            return LinearGradient(
                colors: [
                    Color(red: 0.10, green: 0.45, blue: 0.20),
                    Color(red: 0.05, green: 0.25, blue: 0.15)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }

        return LinearGradient(
            colors: [
                Color(red: 0.22, green: 0.22, blue: 0.24),
                Color.black
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    private var foregroundColor: Color {
        .white
    }

    var body: some View {
        Button {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            action()
        } label: {
            Text(title)
                .font(.title2.bold())
                .foregroundStyle(foregroundColor)
                .frame(width: 72, height: 72)
                .background(
                    Circle()
                        .fill(backgroundColor)
                )
                .shadow(
                    color: .black.opacity(0.35),
                    radius: isPressed ? 1 : 4,
                    y: isPressed ? 1 : 4
                )
                .scaleEffect(isPressed ? 0.94 : 1.0)
                .animation(
                    .spring(response: 0.25, dampingFraction: 0.7),
                    value: isPressed
                )
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
