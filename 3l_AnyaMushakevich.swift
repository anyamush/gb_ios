//
//  3l_AnyaMushakevich.swift
//  1l_AnyaMushakevich.playground
//
//  Created by Anya Mushakevich on 11/1/21.
//

import Foundation
import UIKit
// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
enum carState {
    case startEngine, stopEngine, openWindows, closeWindows, fillCargo(weight:Double), emptyCargo
}

// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

struct SportCar {
    var brand: String = "" // марка
    var year: Int = 2000// год выпуска
    var cargoVolume: Double = 0.0 // объем багажника/кузова
    var isStarted: Bool =  false  // запущен ли двигатель
    var windowsOpen: Bool = false // открыты ли окна
    var filledCargoVolume: Double = 0.0 // заполненный объем багажника
    mutating func changeCarState(action: carState) {
        switch action {
        case .startEngine:
            isStarted = true
        case .stopEngine:
            isStarted = false
        case .openWindows:
            windowsOpen = true
        case .closeWindows:
            windowsOpen = false
        case .fillCargo(let weight) where weight + filledCargoVolume < cargoVolume:
        filledCargoVolume = filledCargoVolume + weight
        case .emptyCargo:
            filledCargoVolume = 0
        default: break
        }
    }
}

struct TrunkCar {
    var brand: String = "" // марка
    var year: Int = 2000// год выпуска
    var cargoVolume: Double = 0.0 // объем багажника/кузова
    var isStarted: Bool =  false  // запущен ли двигатель
    var windowsOpen: Bool = false // открыты ли окна
    var filledCargoVolume: Double = 0.0 // заполненный объем багажника
    mutating func changeCarState(action: carState) {
        switch action {
        case .startEngine:
            isStarted = true
        case .stopEngine:
            isStarted = false
        case .openWindows:
            windowsOpen = true
        case .closeWindows:
            windowsOpen = false
                // remember - do the where keyword!
        case .fillCargo (let weight) where weight + filledCargoVolume < cargoVolume:
        filledCargoVolume = filledCargoVolume + weight
        case .emptyCargo:
            filledCargoVolume = 0
        default: break
        }
    }
}

// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var car1:TrunkCar = TrunkCar(brand: "Marza", year: 2021, cargoVolume: 50.2, isStarted: false, windowsOpen: false, filledCargoVolume: 0.0)

var car2:SportCar = SportCar(brand: "Audi Sport", year: 2021, cargoVolume: 10.2, isStarted: false, windowsOpen: false, filledCargoVolume: 0.0)
// 6. Вывести значения свойств экземпляров в консоль.
print(car1)
print(car2)

car1.changeCarState(action: .startEngine)
car1.changeCarState(action: .openWindows)
car1.changeCarState(action: .fillCargo(weight: 2.0))
print(car1)

car2.changeCarState(action: .openWindows)
car2.changeCarState(action: .closeWindows)
car2.changeCarState(action: .fillCargo(weight: 502.0))
car2.changeCarState(action: .startEngine)
car2.changeCarState(action: .stopEngine)

print(car2)
