//
//  RequestService.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation

protocol RequestService{
    var networkService: Requestable {get}
    var fetchEndpoint: RequestEndpoint? {get set}
}
