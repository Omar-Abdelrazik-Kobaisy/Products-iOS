//
//  CoreDataError.swift
//  
//
//  Created by Omar on 27/10/2024.
//

import Foundation
public enum CoreDataError: Error{
    case cannotFetch(String)
    case cannotSave(String)
}
