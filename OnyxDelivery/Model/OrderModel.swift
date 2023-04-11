//
//  OrderModel.swift
//  OnyxDelivery
//
//  Created by devsalih on 10.04.2023.
//

struct OrderModel: Codable {
    let data: OrderData
    let result: RequestResult

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case result = "Result"
    }
}

struct OrderData: Codable {
    let orders: [Order]

    enum CodingKeys: String, CodingKey {
        case orders = "DeliveryBills"
    }
}

struct Order: Codable {
    let amount, date, no, serial: String
    let time, type: String
    let address: String
    let apartment, build, floor, name: String
    let deliveryAmount, statusFlag: String
    let mobileNo, regionName, taxAmount: String
    
    var amountString: String { String(format: "%.2f LE", Double(amount) ?? 0) }
    var deliveryAmountString: String { String(format: "%.2f LE", Double(deliveryAmount) ?? 0) }
    var taxAmountString: String { String(format: "%.2f LE", Double(taxAmount) ?? 0) }
    
    var totalPrice: String {
        let amount = Double(self.amount) ?? 0
        let deliveryAmount = Double(self.deliveryAmount) ?? 0
        let taxAmount = Double(self.taxAmount) ?? 0
        return String(format: "%.2f LE", amount + deliveryAmount + taxAmount)
    }
    
    var status: String {
        ["New", "Delivered", "Partial Return", "Full Return"][Int(statusFlag) ?? 0]
    }
    
    var color: String {
        ["29D40F", "707070", "004F62", "D42A0F"][Int(statusFlag) ?? 0]
    }

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
