//
//  HelloRepository.swift
//  MoyaTest
//
//  Created by 岡本 翔真 on 2023/01/25.
//

final class HelloRepository {
    private let helloApi: HelloApiProtocol

    init(helloApi: HelloApiProtocol) {
        self.helloApi = helloApi
    }
}

extension HelloRepository: HelloRepositoryProtocol {
    func hello() async throws{
        try await helloApi.fetchHelloData()
    }
}

