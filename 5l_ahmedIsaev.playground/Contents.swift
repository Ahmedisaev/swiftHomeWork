import UIKit

/* 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль.
 
 */

enum carDoors {
    case open, close
}

enum carWindows {
    case open, close
}

enum carEngine {
    case on, off
}

enum sportCarSportMode {
    case on, off
}

enum sportCarSpoiler {
    case on, off
}

enum sportCarInteriorLighting {
    case on, off
}

enum trunkCarPetrol {
    case gasoline, diesel
}

protocol Car {
    var brand: String { get }
    var releaseYear: Int { get }
    var color: UIColor { get }
    var door: carDoors { get set } //констукция { get set } говорит о том, что свойство должно уметь менять значение т.е. константой его объявлять нельзя, только переменной.
    var window: carWindows { get set }
    var engine: carEngine { get set }
    
   // mutating func carEngineState()
   // mutating func carWindowState()
   // mutating func carDoorState()
}

extension Car {
    
    mutating func carEngineState(engine: carEngine) {
        self.engine = engine
        if engine == .on {
            print("The car engine is turn on")
        } else {
            print("The car engine is turn off")
        }
    }
    mutating func carWindowState(window: carWindows) {
        self.window = window
        if window == .open {
            print("The car window is open")
        } else {
            print("The car window is close")
        }
    }
    mutating func carDoorState(door: carDoors) {
        self.door = door
        if door == .open {
            print("The car door is open")
        } else {
            print("The car door is close")
        }
    }
    
}

class sportCar: Car {
    
    var brand: String
    var releaseYear: Int
    var color: UIColor
    var door: carDoors
    var window: carWindows
    var engine: carEngine
    var sportMode: sportCarSportMode
    var spoiler: sportCarSpoiler
    var interiorLighting: sportCarInteriorLighting
    init(brand: String, releaseYear: Int, color: UIColor, door: carDoors, window: carWindows, engine: carEngine, sportMode: sportCarSportMode, spoiler: sportCarSpoiler, interiorLighting: sportCarInteriorLighting) {
        self.brand = brand
        self.releaseYear = releaseYear
        self.color = color
        self.door = door
        self.window = window
        self.engine = engine
        self.sportMode = sportMode
        self.spoiler = spoiler
        self.interiorLighting = interiorLighting
    }
    
    func sportModeControl(sportMode: sportCarSportMode) {
        self.sportMode = sportMode
        switch sportMode {
        case .on:
            print("Sport mode is active now")
        case .off:
            print("Sport mode is not active now")
        }
    }
    
    func interiorLightingControl(interiorLighting: sportCarInteriorLighting) {
        self.interiorLighting = interiorLighting
        switch interiorLighting {
        case .on:
            print("Lighting mode in the car interior is turn on")
        case .off:
            print("Lighting mode in the car interior is turn off")
        }
    }
    
    func spoilerState(spoiler: sportCarSpoiler) {
        self.spoiler
        switch spoiler {
        case .on:
            print("The car spoiler is lowered")
        case .off:
            print("The car spoiler is raised")
        }
    }
}

class trunkCar: Car {
    let brand: String
    let releaseYear: Int
    let color: UIColor
    var door: carDoors
    var window: carWindows
    var engine: carEngine
    var trunkCarVolume: Double
    var typeOfPetrol: trunkCarPetrol
    var gasEquipment: Bool
    init(brand: String, releaseYear: Int, color: UIColor, door: carDoors, window: carWindows, engine: carEngine, trunkCarVolume: Double, typeOfPetrol: trunkCarPetrol, gasEquipment: Bool) {
        self.brand = brand
        self.releaseYear = releaseYear
        self.color = color
        self.door = door
        self.window = window
        self.engine = engine
        self.trunkCarVolume = trunkCarVolume
        self.typeOfPetrol = typeOfPetrol
        self.gasEquipment = gasEquipment
    }
}

extension sportCar: CustomStringConvertible {
    func writeDescr() {
        print(description)
    }
    var description: String {
        return "A sport car: \(brand); Year of release: \(releaseYear); Сar color: \(color); Сar doors are now: \(door); Car windows are now: \(window); Engine: \(engine); Sport mode: \(sportMode); Spoiler state: \(spoiler); Interior light mode: \(interiorLighting)"
    }
}

extension trunkCar: CustomStringConvertible {
    func writeDescr() {
        print(description)
    }
    
    var description: String {
        return "A trunk car: \(brand); Year of release: \(releaseYear); Car color: \(color); Car doors are now: \(carDoors.self); Car windows are now: \(window); Engine: \(engine), Trunk volume: \(trunkCarVolume); Type of petrol: \(typeOfPetrol); The truck has gas equipment installed: \(gasEquipment)"
    }
}


var rufSportCar = sportCar(brand: "Ruf", releaseYear: 2022, color: .green, door: .close, window: .open, engine: .on, sportMode: .on, spoiler: .on, interiorLighting: .on)

rufSportCar.sportModeControl(sportMode: .off)

rufSportCar.writeDescr()

rufSportCar.carEngineState(engine: .off)

rufSportCar.sportModeControl(sportMode: .off)


var mercedesBenzTrunkCar = trunkCar(brand: "Mercedes-Benz", releaseYear: 2022, color: .white, door: .close, window: .close, engine: .off, trunkCarVolume: 15000.0, typeOfPetrol: .gasoline, gasEquipment: true)


mercedesBenzTrunkCar.writeDescr()

mercedesBenzTrunkCar.carDoorState(door: .open)
mercedesBenzTrunkCar.carEngineState(engine: .on)



