//
//  DBManager.swift
//  OnyxDelivery
//
//  Created by devsalih on 12.04.2023.
//

import Foundation
import SQLite

class DBManager {
    private var db: Connection!
    private var orders: Table!
    
    private var serial: Expression<String>!
    private var status: Expression<String>!
    private var date: Expression<String>!
    private var dateFormatted: Expression<String>!
    private var time: Expression<String>!
    private var name: Expression<String>!
    private var mobileNo: Expression<String>!
    private var address: Expression<String>!
    private var apartment: Expression<String>!
    private var build: Expression<String>!
    private var floor: Expression<String>!
    private var regionName: Expression<String>!
    private var amount: Expression<String>!
    private var deliveryAmount: Expression<String>!
    private var taxAmount: Expression<String>!
    
    init() {
        do {
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
            
            db = try Connection("\(path)/orders.sqlite3")
            
            orders = Table("orders")
            
            serial = Expression<String>("serial")
            status = Expression<String>("status")
            date = Expression<String>("date")
            dateFormatted = Expression<String>("dateFormatted")
            time = Expression<String>("time")
            name = Expression<String>("name")
            mobileNo = Expression<String>("mobilNo")
            address = Expression<String>("address")
            apartment = Expression<String>("apartment")
            build = Expression<String>("build")
            floor = Expression<String>("floor")
            regionName = Expression<String>("regionName")
            amount = Expression<String>("amount")
            deliveryAmount = Expression<String>("deliveryAmount")
            taxAmount = Expression<String>("taxAmount")
            
            if (!UserDefaults.standard.bool(forKey: "db")) {
                try db.run(orders.create { (t) in
                    t.column(serial, primaryKey: true)
                    t.column(status)
                    t.column(date)
                    t.column(dateFormatted)
                    t.column(time)
                    t.column(name)
                    t.column(mobileNo)
                    t.column(address)
                    t.column(apartment)
                    t.column(build)
                    t.column(floor)
                    t.column(regionName)
                    t.column(amount)
                    t.column(deliveryAmount)
                    t.column(taxAmount)
                })
                
                UserDefaults.standard.set(true, forKey: "db")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    public func addOrder(order o: Order) {
        do {
            try db.run(orders.insert(serial <- o.serial,
                                     status <- o.status,
                                     date <- o.date,
                                     dateFormatted <- o.dateFormatted,
                                     time <- o.time,
                                     name <- o.name,
                                     mobileNo <- o.mobileNo,
                                     address <- o.address,
                                     apartment <- o.apartment,
                                     build <- o.build,
                                     floor <- o.floor,
                                     regionName <- o.regionName,
                                     amount <- o.amount,
                                     deliveryAmount <- o.deliveryAmount,
                                     taxAmount <- o.taxAmount
                                    ))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func write(orders arr: [Order]) {
        do {
            try db.run(orders.delete())
            arr.forEach { addOrder(order: $0) }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func getOrders(onlyNews: Bool) -> [Order] {
        
        var orderModels: [Order] = []
        
        if onlyNews == true {
            orders = orders.filter(status == "0").order(dateFormatted.desc)
        } else {
            orders = orders.filter(status != "0").order(dateFormatted.desc)
        }
        
        do {
            for order in try db.prepare(orders) {
                let orderModel: Order = Order()
                
                orderModel.serial = order[serial]
                orderModel.status = order[status]
                orderModel.date = order[date]
                orderModel.time = order[time]
                orderModel.name = order[name]
                orderModel.mobileNo = order[mobileNo]
                orderModel.address = order[address]
                orderModel.apartment = order[apartment]
                orderModel.build = order[build]
                orderModel.floor = order[floor]
                orderModel.regionName = order[regionName]
                orderModel.amount = order[amount]
                orderModel.deliveryAmount = order[deliveryAmount]
                orderModel.taxAmount = order[taxAmount]
                
                orderModels.append(orderModel)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return orderModels
    }
}
