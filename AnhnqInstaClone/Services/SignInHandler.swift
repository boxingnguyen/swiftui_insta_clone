//
//  SignInHandler.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 20/12/2021.
//

import Alamofire
import Combine

class SignInHandler: APIHandler {
    let baseUrl = "https://run.mocky.io/v3/603ceccd-84fc-4d0d-89a3-f40140e729f4"
    @Published var WoofModel: WoofModel?
    @Published var isLoading = false

//    func getRandomDog() {
//        isLoading = true
//
//        AF.request(baseUrl, method: .get).responseDecodable { [weak self] (response: DataResponse<WoofModel, AFError>) in
//            guard let weakSelf = self else { return }
//
//            guard let response = weakSelf.handleResponse(response) as? WoofModel else {
//                weakSelf.isLoading = false
//                return
//            }
//
//            weakSelf.isLoading = false
//            weakSelf.WoofModel = response
//        }
//    }
}
