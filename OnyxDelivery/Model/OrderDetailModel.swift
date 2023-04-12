//
//  OrderDetailModel.swift
//  OnyxDelivery
//
//  Created by devsalih on 12.04.2023.
//

struct OrderDetailModel: Codable {
    let data: DataClass
    let result: RequestResult

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case result = "Result"
    }
}

struct DataClass: Codable {
    let orders: [OrderDetail]

    enum CodingKeys: String, CodingKey {
        case orders = "DeliveryBillItems"
    }
}

class OrderDetail: Codable {
    public var itemCode: String = ""
    public var itemName: String = ""
    public var itemPrice: String = ""
    public var vatPercentage: String = ""
    public var vatAmount: String = ""
    
    enum CodingKeys: String, CodingKey {
        case itemCode = "I_CODE"
        case itemName = "I_NM"
        case itemPrice = "I_PRICE"
        case vatPercentage = "VAT_PRCNT"
        case vatAmount = "VAT_AMT"
    }
}
