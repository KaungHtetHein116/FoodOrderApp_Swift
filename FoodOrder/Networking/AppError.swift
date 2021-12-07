//
//  AppError.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 12/1/21.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unkownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unkownError:
            return "No idea what the error is"
        case .invalidUrl:
            return "Invalid Url"
        case .serverError(let error):
            return error
        }
    }
}
