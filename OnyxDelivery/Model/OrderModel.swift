//
//  OrderModel.swift
//  OnyxDelivery
//
//  Created by devsalih on 10.04.2023.
//

struct OrderModel: Codable {
    let order: Order
    let result: RequestResult

    enum CodingKeys: String, CodingKey {
        case order = "Data"
        case result = "Result"
    }
}

struct Order: Codable {
    let deliveryBills: [DeliveryBill]

    enum CodingKeys: String, CodingKey {
        case deliveryBills = "DeliveryBills"
    }
}

struct DeliveryBill: Codable {
    let amount, date, no, serial: String
    let time, type: String
    let address: String
    let apartment, build, floor, name: String
    let deliveryAmount, statusFlag: String
    let mobileNo, regionName, taxAmount: String

    enum CodingKeys: String, CodingKey {
        case amount = "BILL_AMT"
        case date = "BILL_DATE"
        case no = "BILL_NO"
        case serial = "BILL_SRL"
        case time = "BILL_TIME"
        case type = "BILL_TYPE"
        case address = "CSTMR_ADDRSS"
        case apartment = "CSTMR_APRTMNT_NO"
        case build = "CSTMR_BUILD_NO"
        case floor = "CSTMR_FLOOR_NO"
        case name = "CSTMR_NM"
        case deliveryAmount = "DLVRY_AMT"
        case statusFlag = "DLVRY_STATUS_FLG"
        case mobileNo = "MOBILE_NO"
        case regionName = "RGN_NM"
        case taxAmount = "TAX_AMT"
    }
}
