//
//  InformationTableViewCell.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 25/02/21.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var valueLabel: UILabel!

  func setValue(_ modelValue: Information) {
    nameLabel.text = modelValue.nombre
    valueLabel.text = String(modelValue.valor)
  }
}
