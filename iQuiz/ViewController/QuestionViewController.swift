//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Caio Mori on 21/11/24.
//

import UIKit

class QuestionViewController: UIViewController {
    
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
        } else {
            sender.backgroundColor = .red
            print("O usuário errou")
        }
        
        if (questionNumber < questions.count - 1){
            questionNumber += 1
            setTimer(after: 0.5, execute: generateQuestion)
            
        } else {
            questionNumber = 0
            setTimer(after: 0.5, execute: navigateToResult)
        }
    }
    
    @objc func navigateToResult(){
        performSegue(withIdentifier: "navigateToResults", sender: nil)
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
        questionTitleLabel.text = questions[questionNumber].title
        for button in botoesResposta {
            let buttonTitle = questions[questionNumber].awnsers[button.tag]
            button.setTitle(buttonTitle, for: .normal)
            button.backgroundColor = UIColor(red: 255/255, green: 140/255, blue: 14/255, alpha: 1.0)
        }
    }
    
    func setTimer(after time: Double, execute action: @escaping () -> Void) {
        Timer.scheduledTimer(withTimeInterval: time, repeats: false) { _ in
            action()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultsVC = segue.destination as? ResultsViewController else { return }
        resultsVC.score = self.score
    }

}
