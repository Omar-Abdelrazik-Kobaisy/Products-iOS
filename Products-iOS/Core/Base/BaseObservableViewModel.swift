//
//  BaseObservableViewModel.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation
import Combine
import oAmNetworking

class BaseObservableViewModel: ObservableObject{
    @Published var networkMonitor = NetworkMonitor()
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    @Published var showConnectionError: Bool = false
    @Published var showSuccess: Bool = false
    @Published var errorMessage: String = ""
    @Published var connectionErrorMessage: String = ""
    @Published var successMessage: String = ""
    var cancellables = Set<AnyCancellable>()
    
    
    init(){
        checkConnection()
        bindConnectionError()
        bindError()
        bindSuccess()
    }
    
}

extension BaseObservableViewModel{
    private func checkConnection(){
        networkMonitor.$isConnected
            .sink(receiveValue: onReceiveValue(_:))
            .store(in: &cancellables)
    }
    private func onReceiveValue(_ isConnected: Bool){
        self.connectionErrorMessage = isConnected ? "" : "Connection Error"
    }
}

extension BaseObservableViewModel{
    private func bindConnectionError(){
        $connectionErrorMessage
            .map{!$0.isEmpty}
            .assign(to: &$showConnectionError)
    }
    private func bindError(){
        $errorMessage
            .map({!$0.isEmpty})
            .assign(to: &$showError)
    }
    private func bindSuccess(){
        $successMessage
            .map({!$0.isEmpty})
            .assign(to: &$showSuccess)
    }
}

extension BaseObservableViewModel{
    public func onReceive(_ completion: Subscribers.Completion<NetworkError>){
        switch completion {
        case .failure(let error):
            errorMessage = error.localizedDescription
            isLoading = false
        default:
            break
        }
    }
}
