//
//  LocalData.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 24/02/21.
//

import Foundation
import UIKit
import CoreData

struct LocalData {
  private var constants: Constants = Constants()

  func saveData(userName: String, password: String, completion: @escaping (String) -> ()) {
    let passwordData: Data = encryptedPassword(password)
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let context = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
    let newUser = NSManagedObject(entity: entity!, insertInto: context)
    newUser.setValue(userName, forKey: "username")
    newUser.setValue(passwordData, forKey: "password")
    do {
      try context.save()
      completion(constants.savedCorrectly)
    } catch {
      completion(constants.tryAgainLater)
    }
  }

  func loadData(userName: String, password: String, completion: @escaping (LoginModel) -> ()) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let context = appDelegate.persistentContainer.viewContext
    let request: NSFetchRequest<Users> = Users.fetchRequest()

    do {
      let arrayUsers = try context.fetch(request)
      arrayUsers.enumerated().forEach { (index, user) in
        guard let name = user.username, let passwordData = user.password else { fatalError(constants.errorText) }
        let passwordString: String = decryptedPassword(passwordData as? Data ?? Data())
        if name == userName, passwordString == password {
          let modelSucces: LoginModel = LoginModel(nameUser: name, textAlert: String(), code: CodeError.success.rawValue)
          completion(modelSucces)
        } else {
          let modelError: LoginModel = LoginModel(nameUser: String(), textAlert: constants.userNotFound, code: CodeError.fail.rawValue)
          if index == arrayUsers.count - 1 {
            completion(modelError)
          }
        }
      }
    } catch {
      fatalError(constants.errorText)
    }
  }

  private func encryptedPassword(_ passwordString: String) -> Data {
    let key: String = constants.key256
    let iv: String = constants.iv
    let aes256 = AES(key: key, iv: iv)
    let encryptedPassword256: Data? = aes256?.encrypt(string: passwordString)
    guard let encryptedPassword: Data = encryptedPassword256 else { return Data() }
    return encryptedPassword
  }

  private func decryptedPassword(_ passwordData: Data) -> String {
    let key: String = constants.key256
    let iv: String = constants.iv
    let aes256 = AES(key: key, iv: iv)
    guard let passwordString: String = aes256?.decrypt(data: passwordData) else { return "" }
    return passwordString
  }
}
