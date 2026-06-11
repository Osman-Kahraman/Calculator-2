//
//  DisplayView.swift
//  VibingCalculator
//
//  Created by Osman Kahraman on 2026-06-11.
//

import SwiftUI

struct DisplayView: View {
    let expression: String
    let result: String

    var body: some View {
        VStack(alignment: .trailing, spacing: 12) {
            Text(expression)
                .font(.title2)

            Text(result)
                .font(.system(size: 48))
                .fontWeight(.bold)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .trailing
        )
        .padding()
        .background(
            RoundedRectangle(
                cornerRadius: 20
            )
            .fill(.gray.opacity(0.15))
        )
    }
}
