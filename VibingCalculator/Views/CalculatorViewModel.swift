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

        do {
            var request = URLRequest(url: endpoint)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let payload = CalculationRequest(expression: expression)
            request.httpBody = try JSONEncoder().encode(payload)

            let (data, response) = try await URLSession.shared.data(for: request)
            guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
                throw URLError(.badServerResponse)
            }

            let decoded = try JSONDecoder().decode(CalculationResponse.self, from: data)
            resultText = "Result: \(decoded.result)"
        } catch {
            errorMessage = "Something went wrong: \(error.localizedDescription)"
        }
    }
}
