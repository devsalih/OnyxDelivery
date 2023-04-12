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

class Order: Codable {
    public var serial: String = ""
    public var status: String = ""
    public var date: String = ""
    public var time: String = ""
    public var name: String = ""
    public var mobileNo: String = ""
    public var address: String = ""
    public var apartment: String = ""
    public var build: String = ""
    public var floor: String = ""
    public var regionName: String = ""
    public var amount: String = ""
    public var deliveryAmount: String = ""
    public var taxAmount: String = ""
    
    public var dateFormatted: String { String(date.reversed()) }
    
    enum CodingKeys: String, CodingKey {
        case serial = "BILL_SRL"
        case status = "DLVRY_STATUS_FLG"
        case date = "BILL_DATE"
        case time = "BILL_TIME"
        case name = "CSTMR_NM"
        case mobileNo = "MOBILE_NO"
        case address = "CSTMR_ADDRSS"
        case apartment = "CSTMR_APRTMNT_NO"
        case build = "CSTMR_BUILD_NO"
        case floor = "CSTMR_FLOOR_NO"
        case regionName = "RGN_NM"
        case amount = "BILL_AMT"
        case deliveryAmount = "DLVRY_AMT"
        case taxAmount = "TAX_AMT"
    }
    
    var statusString: String { ["New", "Delivered", "Partial Return", "Full Return"][Int(status) ?? 0] }
    
    var color: String { ["29D40F", "707070", "004F62", "D42A0F"][Int(status) ?? 0] }
    
    var totalPrice: String {
        let amount = Double(self.amount) ?? 0
        let deliveryAmount = Double(self.deliveryAmount) ?? 0
        let taxAmount = Double(self.taxAmount) ?? 0
        return String(format: "%.2f LE", amount + deliveryAmount + taxAmount)
    }
}
