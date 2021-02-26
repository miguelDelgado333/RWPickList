//
//  Service.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 25/02/21.
//

import Foundation
import Alamofire

class NetworkingService {

  var arrayItems: [Information] = []

  
  /// This function is what performs the consumption of the web service
  /// - Parameters:
  ///   - findWord: Word to search
  ///   - completion: Returns the parsed response of the model type
  func getPeople(completion: @escaping ([Information]) -> ()) {

    let urlString: String = "https://www.mindicador.cl/api"
    Alamofire.request(urlString, method: .get, encoding: URLEncoding(destination: .queryString)).responseString { response in
        switch response.result {
        case .success(let json):
          let jsonData = json.data(using: .utf8)!
          do {
            let decodeJson: ResponseService = try JSONDecoder().decode(ResponseService.self, from: jsonData)
            self.getArrayInformation(items: decodeJson)
            completion(self.arrayItems)
        } catch {
            print("Error", error)
        }
        case .failure(_):
          print("Error in services")
        }

    }
  }

  private func getArrayInformation(items: ResponseService) {
    arrayItems.append(items.bitcoin)
    arrayItems.append(items.dolar)
    arrayItems.append(items.dolar_intercambio)
    arrayItems.append(items.euro)
    arrayItems.append(items.imacec)
    arrayItems.append(items.ipc)
    arrayItems.append(items.ivp)
    arrayItems.append(items.libra_cobre)
    arrayItems.append(items.tasa_desempleo)
    arrayItems.append(items.tpm)
    arrayItems.append(items.uf)
    arrayItems.append(items.utm)
  }
}
