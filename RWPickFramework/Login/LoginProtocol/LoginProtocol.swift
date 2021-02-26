//
//  HomeProtocol.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 24/02/21.
//

import UIKit

protocol LoginPresenterProtocol: class {
  var view: LoginViewProtocol? { get set }
  func registerUser(newUser: String, with password: String)
  func loginUser(newUser: String, with password: String)

}

protocol LoginViewProtocol: class {
  func showAlert(errorMessage: String)
}
