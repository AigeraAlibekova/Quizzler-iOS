import Foundation
import UIKit

struct QuizBase {
    let question = [
        Question(t: "\"Azul\" is blue", a: "True"),
        Question(t: "\"Verde\" is green", a: "True"),
        Question(t: "\"Rojo\" is pink", a: "False"),
        Question(t: "\"Pan\" is bread", a: "True"),
        Question(t: "\"Platano\" is a color", a: "False"),
        Question(t: "\"Uva\" is sugar", a: "False"),
        Question(t: "\"Quarenta\" is fifth", a: "False"),
        Question(t: "\"Calle\" is food", a: "False"),
        Question(t: "\"Avogado\" is a lawyer", a: "True"),
        Question(t: "\"Cien\" is one", a: "False"),
        Question(t: "\"Silla\" is a chair", a: "True")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer (_ selectedAnswer: String) -> Bool {
        if selectedAnswer == question[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return question[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber)/Float(question.count - 1)
    }
    
    mutating func nextQuestion() {
        if questionNumber < question.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    mutating func getScore() -> Int {
        return score
    }
}
