//
//  PagedListViewModel.swift
//  SwiftUIPagination
//
//  Created by Anastasia Tarasova on 21.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import Combine

class CharacterPagedListViewModel: ObservableObject
{
    @Published var requestOption: CharacterRequestOption = .characterAlive {
        didSet {
            self.reloadList()
        }
    }
    
    @Published private(set) var items: [CharacterModel] = []
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    private var pendingRequests = Set<AnyCancellable>()
    
    var pendingRequest: AnyCancellable?
    
    func reloadList() {
        self.pendingRequest?.cancel()
        self.resetPageCount()
        self.items.removeAll()
        self.loadNextPage()
    }
    
    func loadNextPage() {
        print("loadNextPage")
        self.pendingRequest?.cancel()
        self.pendingRequest = nil
        
        let status = "\(self.livingStatus) \(nextPage)"
        isPageLoading = true
        let nextPage = self.nextPage
        
        var isCancelled = false
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            
            self?.pendingRequest = CharacterAPI.charactersGet(page: nextPage, name: nil, status: self?.livingStatus, gender: nil)
                .receive(on: RunLoop.main)
            .handleEvents(
                receiveSubscription: { _ in print("Subscription", status) },
                receiveOutput: { _ in  print("Output", status) },
                receiveCompletion: { _ in print("Completion", status) },
                receiveCancel: { print("Cancel", status)
                    isCancelled = true
            },
                receiveRequest: { _ in print("Request", status)
                })
                .sink(receiveCompletion: { completion in
                    guard isCancelled == false else { return }
                    
                    print("finished", status)
                    switch completion {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        break
                    }
                    
                    self?.isPageLoading = false
                }, receiveValue: { characterList in
                    guard isCancelled == false else { return }
                    
                    print("Value", status)
                    self?.page = nextPage
                    self?.items.append(contentsOf: characterList.results)
                })
        }
    }
    
    private var nextPage: Int {
        return page + 1
    }
    
    private func resetPageCount() {
        self.page = -1
    }
    
    private var livingStatus: LivingStatus {
        switch self.requestOption {
            case .characterAlive:
                return .alive
            case .characterDead:
                return .dead
        }
    }
}

enum CharacterRequestOption {
    case characterAlive
    case characterDead
}
