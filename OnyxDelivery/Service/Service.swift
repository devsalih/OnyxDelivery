//
//  Service.swift
//  OnyxDelivery
//
//  Created by devsalih on 10.04.2023.
//

import Alamofire

class Service {
    private let baseUrl = "http://mapp.yemensoft.net/OnyxDeliveryService/Service.svc/";
    private let langNo = "2";
    
    private enum Paths: String {
        case changeDeliveryPassword = "ChangeDeliveryPassword"
        case checkDeliveryLogin = "CheckDeliveryLogin"
        case getDeliveryBillsItems = "GetDeliveryBillsItems"
        case getDeliveryStatusTypes = "GetDeliveryStatusTypes"
        case getReturnBillReasons = "GetReturnBillReasons"
        case updateDeliveryBillStatus = "UpdateDeliveryBillStatus"
    }
    
    private func makeRequest<T: Decodable>(path: Paths, parameters: [String : String], completion: @escaping (Result<T, Error>) -> Void) {
        let url = baseUrl + path.rawValue
        AF.request(url, method: .post, parameters: ["Value" : parameters], encoder: JSONParameterEncoder.default).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let result): completion(.success(result))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
    
    func changePassword(userID: String, oldPassword: String, newPassword: String) {
        let parameters = ["P_LANG_NO": langNo, "P_DLVRY_NO": userID, "P_OLD_PSSWRD": oldPassword, "P_NEW_PSSWRD": newPassword]
        
        makeRequest(path: .changeDeliveryPassword, parameters: parameters) { (result: Result<ResultModel, Error>) in
            switch result {
            case .success(let response): print(response.result.errorNo == 0 ? "Password changed" : response.result.errorMessage)
            case .failure(let error): print(error)
            }
        }
    }
    
    func login(userID: String, password: String, error: @escaping (String) -> Void, user: @escaping (User) -> Void) {
        let parameters = ["P_LANG_NO": langNo, "P_DLVRY_NO": userID, "P_PSSWRD": password]
        
        makeRequest(path: .checkDeliveryLogin, parameters: parameters) { (result: Result<UserModel, Error>) in
            switch result {
            case .success(let response):
                if response.result.errorNo == 0 {
                    user(response.user)
                } else {
                    error(response.result.errorMessage)
                }
            case .failure(let error): print(error)
            }
        }
    }
    
    func getDeliveryBillsItems(userID: String) {
        let parameters = ["P_DLVRY_NO": userID, "P_LANG_NO": langNo, "P_BILL_SRL": "", "P_PRCSSD_FLG": "1"]
        
        makeRequest(path: .getDeliveryBillsItems, parameters: parameters) { (result: Result<OrderModel, Error>) in
            switch result {
            case .success(let response): print(response)
            case .failure(let error): print(error)
            }
        }
    }
    
    func getDeliveryStatusTypes() {
        let parameters = ["P_LANG_NO": langNo]
        
        makeRequest(path: .getDeliveryStatusTypes, parameters: parameters) { (result: Result<DeliveryStatusModel, Error>) in
            switch result {
            case .success(let response): print(response)
            case .failure(let error): print(error)
            }
        }
    }
    
    func getReturnBillReasons() {
        let parameters = ["P_LANG_NO": langNo]
        
        makeRequest(path: .getReturnBillReasons, parameters: parameters) { (result: Result<ReturnBillReasonModel, Error>) in
            switch result {
            case .success(let response): print(response)
            case .failure(let error): print(error)
            }
        }
    }
    
    func updateDeliveryBillStatus(serial: String, statusFlag: String) {
        let parameters = ["P_LANG_NO" : langNo, "P_BILL_SRL" : serial, "P_DLVRY_STATUS_FLG" : statusFlag, "P_DLVRY_RTRN_RSN" : ""]
        
        makeRequest(path: .updateDeliveryBillStatus, parameters: parameters) { (result: Result<ResultModel, Error>) in
            switch result {
            case .success(let response): print(response)
            case .failure(let error): print(error)
            }
        }
    }
}
