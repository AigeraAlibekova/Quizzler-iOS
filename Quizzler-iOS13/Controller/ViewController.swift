import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBase = QuizBase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let selectedAnswer = sender.currentTitle!
        let userAnsweredRight = quizBase.checkAnswer(selectedAnswer)
        
        if userAnsweredRight{
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBase.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateView), userInfo: nil, repeats: false)
    }
    
    @objc func updateView() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBase.getScore())"
        questionLabel.text = quizBase.getQuestionText()
        progressBar.progress = quizBase.getProgress()
    }
}

