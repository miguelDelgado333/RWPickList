//
//  DetailPresenter.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 25/02/21.
//

import Foundation
import UIKit

class DetailPresenter: NSObject {

  weak var view: DetailViewProtocol?
  private var item: Information?

  required init(view: DetailViewProtocol, model: Information) {
    self.view = view
    self.item = model
  }
}

extension DetailPresenter: DetailPresenterProtocol {
  func getTextForLabel(codeLabel: UILabel, nameLabel: UILabel, unidadLabel: UILabel, dateLabel: UILabel, valueLabel: UILabel) {
    codeLabel.text = item?.codigo
    nameLabel.text = item?.nombre
    unidadLabel.text = item?.unidad_medida
    dateLabel.text = item?.fecha
    valueLabel.text = String(item?.valor ?? Float())
  }
}
