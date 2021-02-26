//
//  DetailProtocol.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 25/02/21.
//

import Foundation
import UIKit

protocol DetailPresenterProtocol: class {
  func getTextForLabel(codeLabel: UILabel, nameLabel: UILabel, unidadLabel: UILabel, dateLabel: UILabel, valueLabel: UILabel)

}

protocol DetailViewProtocol: class {
}
