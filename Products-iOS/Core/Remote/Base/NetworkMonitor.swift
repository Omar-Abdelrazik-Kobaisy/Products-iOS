//
//  NetworkMonitor.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation
import Network

final public class NetworkMonitor: ObservableObject{
    private let monitor: NWPathMonitor = NWPathMonitor()
    private let workerQueue: DispatchQueue = DispatchQueue(label: "Monitor")
    
    @Published public var isConnected: Bool = false
    
    public init(){
        monitor.pathUpdateHandler = {[weak self] path in
            guard let self else{return}
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: workerQueue)
    }
}
