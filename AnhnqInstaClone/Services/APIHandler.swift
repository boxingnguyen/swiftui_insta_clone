//
//  APIHandler.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 20/12/2021.
//

import Alamofire
import Combine

class APIHandler {
    var statusCode = Int.zero

    func handleResponse<T: Decodable>(_ response: DataResponse<T, AFError>) -> Any? {
        switch response.result {
        case .success:
            return response.value
        case .failure:
            return nil
        }
    }
}
