//
//  APError.swift
//  Recipe App
//
//  Created by Parth Barot on 11/15/24.
//

import Foundation

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case emptyData
}
