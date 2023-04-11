//
//  DeliveryStatusType.swift
//  OnyxDelivery
//
//  Created by devsalih on 10.04.2023.
//

struct DeliveryStatusModel: Codable {
    let status: DeliveryStatus
    let result: RequestResult

    enum CodingKeys: String, CodingKey {
        case status = "Data"
        case result = "Result"
    }
}

struct DeliveryStatus: Codable {
    let types: [DeliveryStatusType]

    enum CodingKeys: String, CodingKey {
        case types = "DeliveryStatusTypes"
    }
}

struct DeliveryStatusType: Codable {
    let name, no: String

    enum CodingKeys: String, CodingKey {
        case name = "TYP_NM"
        case no = "TYP_NO"
    }
}
