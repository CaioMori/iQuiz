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
            sender.backgroundColor = .green
            print("O usuário acertou")
            if (questionNumber < questions.count - 1){
                questionNumber += 1
                Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(generateQuestion), userInfo: nil, repeats: false)
            }
            return // garante que saia da função
        }
        sender.backgroundColor = .red
        print("O usuário errou")
    }
    
    func setLayout() {
        navigationItem.hidesBackButton = true
        questionTitleLabel.numberOfLines = 0
        questionTitleLabel.textAlignment = .center
        for botao in botoesResposta {
            botao.layer.cornerRadius = 12.0
            botao.titleLabel?.numberOfLines = 1
            botao.titleLabel?.adjustsFontSizeToFitWidth = true
        }
    }
    
    @objc func generateQuestion(){
        if (questionNumber == questions.count - 1) {
            questionNumber = 0
        }
        questionTitleLabel.text = questions[questionNumber].title
        for button in botoesResposta {
            let buttonTitle = questions[questionNumber].awnsers[button.tag]
            button.setTitle(buttonTitle, for: .normal)
            button.backgroundColor = UIColor(red: 255/255, green: 140/255, blue: 14/255, alpha: 1.0)
        }
    }

}
