//
//  NewMockDataService.swift
//  SwiftUIAdvanced
//
//  Created by Санжар Асанов on 16/6/23.
//

import Foundation
import SwiftUI
import Combine

protocol NewDataServiceProtocol {
    func downloadItemsWithEscaping(completion: @escaping (_ items: [String]) -> ())
    func downloadItemsWithCombine() -> AnyPublisher<[String], Error>
}

class NewMockDataService: NewDataServiceProtocol {
    
    let items: [String]
    
    init(items: [String]?) {
        self.items = items ?? [
            "ONE", "TWO", "THREE"
        ]
    }
    
    func downloadItemsWithEscaping(completion: @escaping (_ items: [String]) -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(self.items)
        }
        
    }
    
    func downloadItemsWithCombine() -> AnyPublisher<[String], Error> {
        Just(items)
            .tryMap({ publishedItem in
                guard !publishedItem.isEmpty else {
                    throw URLError(.badServerResponse)
                }
                return publishedItem
            })
            .eraseToAnyPublisher()
    }
}
