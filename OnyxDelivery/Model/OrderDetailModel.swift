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

struct OrderDetail: Codable {
    let billNo, billSerial, itemUnit, itemCode: String
    let itemName, itemPrice, itemPriceVat, itemQuantity: String
    let mobileNo, size, vatAmount, vatPercentage: String

    enum CodingKeys: String, CodingKey {
        case billNo = "BILL_NO"
        case billSerial = "BILL_SRL"
        case itemUnit = "ITM_UNT"
        case itemCode = "I_CODE"
        case itemName = "I_NM"
        case itemPrice = "I_PRICE"
        case itemPriceVat = "I_PRICE_VAT"
        case itemQuantity = "I_QTY"
        case mobileNo = "MOBILE_NO"
        case size = "P_SIZE"
        case vatAmount = "VAT_AMT"
        case vatPercentage = "VAT_PRCNT"
    }
}
