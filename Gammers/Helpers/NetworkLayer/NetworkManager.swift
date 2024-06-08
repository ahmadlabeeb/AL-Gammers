
//  NetworkManager.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 08/06/2024.


import Foundation
import Moya
import Combine


class NetworkManager<T: TargetType> {
    
    let provider: MoyaProvider<T>
    var subscription = [AnyCancellable]()
    
    init(provider: MoyaProvider<T>) {
        self.provider = provider
    }
    
    func requestData<A: Codable>(target: T) -> Future<A, Error> {
        Future { [weak self] promise in
            guard let self else {return}
            provider.requestPublisher(target).map{$0.data}.decode(type: A.self, decoder: JSONDecoder())
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        promise(.failure(error))
                    }
                } receiveValue: { value in
                    promise(.success(value))
                }
                .store(in: &subscription)
        }
    }
    
    
    
}
