//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by praveen on 15/12/24.
//


import SwiftUI

struct CalculatorView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    
    // A simple layout for a calculator
    let buttonLabels = [
        ["7", "8", "9", "÷"],
        ["4", "5", "6", "×"],
        ["1", "2", "3", "−"],
        ["C", "0", "=", "+"]
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            // Display area
            Text(viewModel.displayValue)
                .font(.largeTitle)
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(80)
                .padding(.horizontal)
            
            // Buttons
            ForEach(buttonLabels, id: \.self) { row in
                HStack(spacing: 20) {
                    ForEach(row, id: \.self) { label in
                        Button(action: {
                            buttonTapped(label)
                        }) {
                            Text(label)
                                .font(.title)
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(40)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    // Handle button actions
    private func buttonTapped(_ label: String) {
        switch label {
            case "C":
                viewModel.clear()
            case "=":
                viewModel.performOperation(.none)
            case "+":
                viewModel.setOperation(.addition)
            case "−":
                viewModel.setOperation(.subtraction)
            case "×":
                viewModel.setOperation(.multiplication)
            case "÷":
                viewModel.setOperation(.division)
            default:
                viewModel.inputNumber(label)
        }
    }
}

#Preview {
    CalculatorView()
}
