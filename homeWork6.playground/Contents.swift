import UIKit

/*
1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/


struct patientHeight {
    var nameOfPatient: String
    var height: Double
}

extension patientHeight: CustomStringConvertible {
    var description : String {
        return "Name of patient: \(nameOfPatient), height of patient: \(height)"
    }
}

struct queue <T> {
    private var patients: [T] = []
    
    mutating func addNewElement(element: T) {
        patients.append(element)
    }
    mutating func removeLastElement() -> T {
        return patients.removeLast()
    }
    
    public var lastPatient: T? {
        if patients.count == 0 {
            print("Array is empty")
            return nil
            
        } else {
            print("Last patient is \(patients.last!)")
            return patients.last
        }
    }
    
    public var fistPatient: T? {
        if patients.count == 0 {
            print("Array is empty")
            return nil
        } else {
            print("First patient is \(patients.first!)")
            return patients.first
        }
    }
    
    func printHeightOfPatients() {
        print(patients)
    }
}

extension queue {
    func filter(predicate:(T) -> Bool) -> [T] {  // Метод высшего порядка
        var result = [T]()
        for patient in patients {
            if predicate(patient) {
                result.append(patient)
            }
        }
        return result
    }
}

var patinentInfo = queue<patientHeight>()

patinentInfo.addNewElement(element: patientHeight(nameOfPatient: "Alexander", height: 177.0))
patinentInfo.addNewElement(element: patientHeight(nameOfPatient: "John", height: 171.0))
patinentInfo.addNewElement(element: patientHeight(nameOfPatient: "Albert", height: 193.0))
patinentInfo.addNewElement(element: patientHeight(nameOfPatient: "Arnaud", height: 175.0))
patinentInfo.addNewElement(element: patientHeight(nameOfPatient: "Mike", height: 181.0))

patinentInfo.printHeightOfPatients()

var heightDetail = patinentInfo.filter(predicate: {$0.height > 180.0})

print(heightDetail)

patinentInfo.removeLastElement()
patinentInfo.removeLastElement()

patinentInfo.fistPatient
patinentInfo.lastPatient

patinentInfo.printHeightOfPatients()





