//
//  ResultsViewController.swift
//  iQuiz
//
//  Created by Caio Mori on 23/11/24.
//


import UIKit

class ResultsViewController: UIViewController {
    var score: Int?
    
    @IBOutlet weak var percentualResultLabel: UILabel!

    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet weak var redoiQuizOutlet: UIButton!

    @IBAction func redoiQuizAction(_ sender: UIButton) {
        
    }
    
    func getPercentualResult() -> String {
        let percentual = Double(score!) / Double(questions.count) * 100
        return String(format: "%.0f", percentual)
    }
    
    func layoutConfig() {
        navigationItem.hidesBackButton = true
        resultLabel.text = "Você acertou \(score!) de \(questions.count) perguntas"
        let percentual: String = getPercentualResult()
        percentualResultLabel.text = "Percentual final: \(percentual)%"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutConfig()
        
    }
}
