//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Caio Mori on 21/11/24.
//

import UIKit

class QuestaoViewController: UIViewController {
    
    var score: Int = 0
    
    var questionNumber: Int = 0

    @IBOutlet weak var questionTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        generateQuestion()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var botoesResposta: [UIButton]!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        print(questions[questionNumber].correctAwnser)
        let isCorrectAwnser: Bool = questions[questionNumber].correctAwnser == sender.tag
        if (isCorrectAwnser) {
            score += 1
            if (questionNumber < questions.count - 1){
                questionNumber += 1
                generateQuestion()
            }
        }
    }
    
    func setLayout() {
        navigationItem.hidesBackButton = true
        questionTitleLabel.numberOfLines = 0
        questionTitleLabel.textAlignment = .center
        for botao in botoesResposta {
            botao.layer.cornerRadius = 12.0
            botao.titleLabel?.numberOfLines = 0
            botao.titleLabel?.adjustsFontSizeToFitWidth = true
        }
    }
    
    func generateQuestion(){
        questionTitleLabel.text = questions[questionNumber].title
        for button in botoesResposta {
            let buttonTitle = questions[questionNumber].awnsers[button.tag]
            button.setTitle(buttonTitle, for: .normal)
        }
    }

}
