//
//  UserModel.swift
//  OnyxDelivery
//
//  Created by devsalih on 10.04.2023.
//

struct UserModel: Codable {
    let user: User
    let result: RequestResult

    enum CodingKeys: String, CodingKey {
        case user = "Data"
        case result = "Result"
    }
}

struct User: Codable {
    let deliveryName: String?

    enum CodingKeys: String, CodingKey {
        case deliveryName = "DeliveryName"
    }
}

struct RequestResult: Codable {
    let errorMessage: String
    let errorNo: Int

    enum CodingKeys: String, CodingKey {
        case errorMessage = "ErrMsg"
        case errorNo = "ErrNo"
    }
}

struct ResultModel: Codable {
    let result: RequestResult
    
    enum CodingKeys: String, CodingKey {
        case result = "Result"
    }
}
