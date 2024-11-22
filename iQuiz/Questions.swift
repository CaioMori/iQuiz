//
//  Questions.swift
//  iQuiz
//
//  Created by Caio Mori on 22/11/24.
//

struct Question {
    var title: String
    var awnsers: [String]
    var correctAwnser: Int
}

let questions: [Question] = [
    Question(title: "O que é Swift?", awnsers: [
        "Linguagem de programação da Apple.",
        "Usada para apps iOS e macOS.",
        "Moderna, segura e open-source."
    ], correctAwnser: 0),
    
    Question(title: "O que é uma variável em Swift e como declará-la?", awnsers: [
        "Valor mutável, use var.",
        "Variável é um valor que muda, declare com var.",
        "Use var para declarar valores que podem mudar."
    ], correctAwnser: 1),
    
    Question(title: "Qual a diferença entre let e var em Swift?", awnsers: [
        "let é constante, var é variável.",
        "let não muda, var pode mudar.",
        "let fixa o valor, var permite alterações."
    ], correctAwnser: 0)
]
