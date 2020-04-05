//
//  CharacterAPI+Combine.swift
//  SwiftUIPagination
//
//  Created by Anastasia Tarasova on 21.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import Combine

extension CharacterAPI {
    
    class func charactersGet(
        page: Int? = nil,
        name: String? = nil,
        status: LivingStatus? = nil,
        gender: Gender? = nil,
        apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue) -> Future<CharacterList, Error>
    {
        return Future<CharacterList, Error> { seal in
            CharacterAPI.charactersGet(page: page, name: name, status: status, gender: gender, apiResponseQueue: apiResponseQueue) { (characterList, error) in
                if let list = characterList {
                    seal(.success(list))
                } else {
                    let unwrappedError = error ?? AppError.unexpected("Neither data nor error were returned")
                    seal(.failure(unwrappedError))
                }
            }
        }
    }
}
