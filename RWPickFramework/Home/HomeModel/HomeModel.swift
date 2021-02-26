//
//  HomeModel.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 25/02/21.
//

import Foundation
import UIKit

struct ResponseService: Codable {
  let version: String
  let autor: String
  let fecha: String
  let uf: Information
  let ivp: Information
  let dolar: Information
  let dolar_intercambio: Information
  let euro: Information
  let ipc: Information
  let utm: Information
  let imacec: Information
  let tpm: Information
  let libra_cobre: Information
  let tasa_desempleo: Information
  let bitcoin: Information
  
}

struct Information: Codable {
  let codigo: String
  let nombre: String
  let unidad_medida: String
  let fecha: String
  let valor: Float
}
