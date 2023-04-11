//
//  ReturnBillReasonModel.swift
//  OnyxDelivery
//
//  Created by devsalih on 10.04.2023.
//

struct ReturnBillReasonModel: Codable {
    let data: ReturnBillReasonData
    let result: RequestResult

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case result = "Result"
    }
}

struct ReturnBillReasonData: Codable {
    let returnBillReasons: [ReturnBillReason]?

    enum CodingKeys: String, CodingKey {
        case returnBillReasons = "ReturnBillReasons"
    }
}

struct ReturnBillReason: Codable {
    let deliveryReturnReason: String

    enum CodingKeys: String, CodingKey {
        case deliveryReturnReason = "DLVRY_RTRN_RSN"
    }
}
