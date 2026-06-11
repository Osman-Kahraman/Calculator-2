import SwiftUI

struct CalculatorView: View {
    @StateObject private var vm = CalculatorViewModel()

    private let rows: [[String]] = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        ["0", ".", "=", "+"]
    ]

    var body: some View {
        VStack(spacing: 12) {
            VStack(alignment: .trailing, spacing: 8) {
                Text(vm.expression)
                    .font(.largeTitle.weight(.semibold))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)

                if vm.isLoading {
                    ProgressView("Calculating on AWS...")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }

                if let error = vm.errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.footnote)
                }

                if !vm.resultText.isEmpty {
                    Text(vm.resultText)
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .transition(.opacity.combined(with: .move(edge: .trailing)))
                }
            }
            .padding(.horizontal)
            .padding(.top)

            Spacer()

            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    CalculatorButton(title: "C") { vm.clear() }
                    CalculatorButton(title: "⌫") { vm.backspace() }
                }

                ForEach(rows, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(row, id: \.self) { key in
                            CalculatorButton(title: key) {
                                if key == "=" {
                                    Task { await vm.calculate() }
                                } else {
                                    vm.append(key)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .navigationTitle("Vibing Calculator")
    }
}

#Preview {
    NavigationStack { CalculatorView() }
}
