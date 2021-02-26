//
//  DetailViewController.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 25/02/21.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet private weak var codeLabel: UILabel!
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var unidadLabel: UILabel!
  @IBOutlet private weak var dateLabel: UILabel!
  @IBOutlet private weak var valueLabel: UILabel!

  var presenter: DetailPresenterProtocol?

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.getTextForLabel(codeLabel: codeLabel, nameLabel: nameLabel, unidadLabel: unidadLabel, dateLabel: dateLabel, valueLabel: valueLabel)
  }
}

extension DetailViewController: DetailViewProtocol {
}
