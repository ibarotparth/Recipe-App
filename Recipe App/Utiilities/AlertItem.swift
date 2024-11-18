//
//  AlertItem.swift
//  Recipe App
//
//  Created by Parth Barot on 11/15/24.
//

import SwiftUI

struct AlertItem: Identifiable, Equatable{
 
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button?
    
    // Equatable conformance for unit testing
    static func == (lhs: AlertItem, rhs: AlertItem) -> Bool {
        return lhs.title == rhs.title && lhs.message == rhs.message
    }
}

enum AlertContext {
    
    //MARK: - Network Errors
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("There is an error trying to reach the server. If this persists, please contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again or contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data received from the server was invalid. Please try again or contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let emptyData      = AlertItem(title: Text("No Data Error"),
                                            message: Text("The data is empty."),
                                            dismissButton: .default(Text("Ok")))
}
