import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published private(set) var displayValue: String = "0"  // Updates the UI
    private var model = CalculatorModel()
    
    // Bind button taps to the Model's logic
    func inputNumber(_ number: String) {
        model.appendNumber(number)
        displayValue = model.currentValue
    }
    
    func performOperation(_ operation: CalculatorModel.Operation) {
        model.performOperation(operation)
        displayValue = model.currentValue
    }
    
    func setOperation(_ operation: CalculatorModel.Operation) {
        model.setOperation(operation)
        displayValue = model.currentValue
    }
    
    func clear() {
        model.clear()
        displayValue = model.currentValue
    }
}
