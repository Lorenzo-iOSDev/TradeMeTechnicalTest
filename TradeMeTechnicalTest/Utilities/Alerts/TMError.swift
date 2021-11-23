//
//  TMError.swift
//  TradeMeTechnicalTest
//
//  Created by Lorenzo Zemp on 23/11/21.
//

import Foundation

//TMError error object used for when completion handler in NetworkManager returns a TMError
enum TMError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
