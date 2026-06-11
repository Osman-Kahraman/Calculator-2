//
//  LoadingOverlayView.swift
//  VibingCalculator
//
//  Created by Osman Kahraman on 2026-06-11.
//


import SwiftUI

struct LoadingOverlayView: View {
    let message: String

    var body: some View {
        ZStack {
            Color.black.opacity(0.65)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ProgressView()
                Text(message)
                    .multilineTextAlignment(.center)
                    .font(.headline)
            }
            .padding(30)
            .background(.ultraThinMaterial)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 20
                )
            )
        }
    }
}

#Preview {
    LoadingOverlayView(
        message: "Provisioning AWS resources..."
    )
}
