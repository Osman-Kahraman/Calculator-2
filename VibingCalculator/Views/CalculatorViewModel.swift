import Foundation
import SwiftUI
import Combine

@MainActor
final class CalculatorViewModel: ObservableObject {
    @Published var expression: String = ""
    @Published var resultText: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let endpoint = URL(string: "...")!

    func append(_ text: String) {
        expression.append(text)
    }

    func clear() {
        expression = ""
        resultText = ""
        errorMessage = nil
    }

    func backspace() {
        guard !expression.isEmpty else { return }
        expression.removeLast()
    }

    func calculate() async {
        guard !expression.isEmpty else { return }
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        await withCheckedContinuation { continuation in
            LambdaService.calculate(expression: self.expression) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let value):
                        self.resultText = "Result: \(value)"
                    case .failure(let error):
                        self.errorMessage = "Something went wrong: \(error.localizedDescription)"
                    }
                    continuation.resume()
                }
            }
        }
    }
}
