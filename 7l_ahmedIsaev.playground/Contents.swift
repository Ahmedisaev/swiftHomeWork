import Foundation

/*
 
 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
 */


// 1) У меня будет программа в которой будет словарь с именами клиентов и уровнем топлива в баках их автомоблей в процентах! Программа будет имиторовать заправку автомобилей и учитывать текущий уровень топлива в бензобаке, чтобы топливо не перелилось.


enum errorsApp: Error {
    case invalidClientsName
    case alreadyMaxTankVolume
    case refuelError
}

struct ClientName {
    let name: String
}

struct ClientsData {
    let clientName: ClientName
    var tankVolume: Int
}

let tankVolumeMax = 100 // Максимально заполненный бензобак. То есть 100%


class PetrolApp {
    var clients = [
        
        "Michael Jordan": ClientsData(clientName: ClientName(name: "Michael Jordan"), tankVolume: 33),
        "Robert Ellis": ClientsData(clientName: ClientName(name: "Robert Ellis"), tankVolume: 41),
        "John Lewis": ClientsData(clientName: ClientName(name: "John Lewis"), tankVolume: 21)
    ]
    
    
    func refuel(clientNamed name: String, refuelCar refuel: Int) -> (ClientName?, errorsApp?) {
        guard let client = clients[name] else {
            return (nil, errorsApp.invalidClientsName)
        }
        guard client.tankVolume < tankVolumeMax else {
            return (nil, errorsApp.alreadyMaxTankVolume)
        }
        
        guard refuel <= (tankVolumeMax - client.tankVolume) else {
            return (nil, errorsApp.refuelError)
        }
        
        var newClientInfo = client
        newClientInfo.tankVolume += refuel
        clients[name] = newClientInfo
        print("Mr \(name), your car is \(newClientInfo.tankVolume) percent refueled!")
        return (newClientInfo.clientName, nil)
        
    }
}


let petrolStation_1 = PetrolApp()

petrolStation_1.refuel(clientNamed: "Robert Ellis", refuelCar: 11)
petrolStation_1.refuel(clientNamed: "Elon Musk", refuelCar: 77)
petrolStation_1.refuel(clientNamed: "John Lewis", refuelCar: 99)


// 2) У меня будет программа которая будет принимать заказы в кофейне. Будет появляться ошибка когда например, введено название несуществующего напитка или когда нехватает требуемой суммы денег.


enum coffeErrors: Error {
    case invalidDrinkName
    case insufficientFunds(dollarsNeeded: Int)
}
enum topUpBalanceError: Error {
    case wrongAmount
}

struct DrinkName {
    let name: String
}

struct Item {
    let drinkName: DrinkName
    var price: Int
}


class CoffeBar {
    
    var menu = [
        "Americano": Item(drinkName: DrinkName(name: "Americano"), price: 3),
        "Espresso": Item(drinkName: DrinkName(name: "Espresso"), price: 2),
        "Late": Item(drinkName: DrinkName(name: "Late"), price: 5),
        "Caputino": Item(drinkName: DrinkName(name: "Cappuccino"), price: 5),
        "Mocha": Item(drinkName: DrinkName(name: "Mocha"), price: 6)
    ]
    
    var balance = 0
    
    func CoffeBarPayment(itemNamed name: String) throws -> DrinkName  {
        guard let item = menu[name] else {
            throw coffeErrors.invalidDrinkName
        }
        guard item.price <= balance else {
            throw coffeErrors.insufficientFunds(dollarsNeeded: (item.price - balance))
        }
        balance -= item.price
        var newItem = item
        menu[name] = newItem
        print("Your \(name) is ready!")
        return newItem.drinkName
    }
    
    func topUpBalance(howMuch amount: Int) throws -> Int {
        guard amount != 0 else {
            throw topUpBalanceError.wrongAmount
        }
        balance += amount
        return balance
    }
}

let coffeBar = CoffeBar()


do {
    let sell_1 = try coffeBar.CoffeBarPayment(itemNamed: "Americano")
} catch coffeErrors.invalidDrinkName {
    print("INVALID NAME OF DRINK!")
} catch coffeErrors.insufficientFunds(let dollarsNeeded) {
    print("MISSING \(dollarsNeeded) DOLLARS!")
}

do {
    let topUp_1 = try coffeBar.topUpBalance(howMuch: 10)
} catch topUpBalanceError.wrongAmount {
    print("WRONG AMOUNT!")
}

do {
    let sell_1 = try coffeBar.CoffeBarPayment(itemNamed: "Cappuccino")
} catch coffeErrors.invalidDrinkName {
    print("INVALID NAME OF DRINK!")
} catch coffeErrors.insufficientFunds(let dollarsNeeded) {
    print("MISSING \(dollarsNeeded) DOLLARS!")
}





