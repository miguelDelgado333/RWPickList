//
//  Constants.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 25/02/21.
//

import Foundation

struct Constants {
  let key256: String = "12345678901234561234567890123456"
  let iv: String = "abcdefghijklmnop"
  let userNotFound: String = "Usario no registrado"
  let errorText: String = "Error"
  let agreeText: String = "Aceptar"
  let savedCorrectly: String = "Guardado Correctamente"
  let tryAgainLater: String = "Intentelo más tarde"
  let hi: String = "Hola"
  let logOut: String = "LogOut"
}

enum CodeError: Int {
  case fail = 404
  case success = 201
}
