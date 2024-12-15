import Foundation

struct CalculatorModel {
    var currentValue: String = "0"  // The current value displayed on the screen
    private var previousValue: Double? = nil
    private var currentOperation: Operation? = nil
    
    // Enum for operations
    enum Operation {
        case addition, subtraction, multiplication, division, none
    }
    
    // Perform calculations based on the selected operation
    mutating func performOperation(_ operation: Operation) {
        guard let value = Double(currentValue) else { return }
        
        if let prevValue = previousValue {
            switch currentOperation {
                case .addition:
                    currentValue = String(prevValue + value)
                case .subtraction:
                    currentValue = String(prevValue - value)
                case .multiplication:
                    currentValue = String(prevValue * value)
                case .division:
                    currentValue = value == 0 ? "Error" : String(prevValue / value)
                default:
                    break
            }
        }
        
        previousValue = Double(currentValue)
        currentOperation = operation
    }
    
    // Save the current value and operation for chaining calculations
    mutating func setOperation(_ operation: Operation) {
        previousValue = Double(currentValue)
        currentValue = "0"
        currentOperation = operation
    }
    
    // Handle number input
    mutating func appendNumber(_ number: String) {
        if currentValue == "0" || currentValue == "Error" {
            currentValue = number
        } else {
            currentValue.append(number)
        }
    }
    
    // Clear everything
    mutating func clear() {
        currentValue = "0"
        previousValue = nil
        currentOperation = nil
    }
}
