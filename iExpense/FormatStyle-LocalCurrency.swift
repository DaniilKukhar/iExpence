//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Danya Kukhar on 10.01.2023.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
