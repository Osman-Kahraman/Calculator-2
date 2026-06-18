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

        let operators = ["+", "-", "*", "/"]
        var op: String?
        var a: Int?
        var b: Int?

        for symbol in operators {
            if let range = expression.range(of: symbol) {
                op = symbol
                let left = String(expression[..<range.lowerBound])
                let right = String(expression[range.upperBound...])
                a = Int(left.trimmingCharacters(in: .whitespaces))
                b = Int(right.trimmingCharacters(in: .whitespaces))
                break
            }
        }

        let operatorMapping: [String: String] = [
            "+": "add",
            "-": "subtract",
            "*": "multiply",
            "/": "divide"
        ]

        guard let op = op, let operation = operatorMapping[op], let a = a, let b = b else {
            errorMessage = "Invalid expression"
            return
        }

        await withCheckedContinuation { continuation in
            LambdaService.calculate(operation: operation, a: a, b: b) { result in
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

