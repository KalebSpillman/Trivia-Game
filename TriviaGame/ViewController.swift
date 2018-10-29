//
//  ViewController.swift
//  TriviaGame
//
//  Created by Kaleb Spillman on 10/18/18.
//  Copyright © 2018 Kaleb Spillman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerButtonA: UIButton!
    
    
    @IBOutlet weak var answerButtonB: UIButton!
    
    @IBOutlet weak var answerButtonC: UIButton!
    
    
    @IBOutlet weak var answerButtonD: UIButton!
    
    var  questions = [TriviaQuestion] ()
    var questionPlaceholder = [TriviaQuestion]()
    var currentIndex: Int!
    var score = 0 {
        didSet {
            scoreLabel.text = "score: \(score)"
        }
    }
    
    var currentQuestion: TriviaQuestion! {
        didSet {
            if let currentQuestion = currentQuestion {
                questionLabel.text = currentQuestion.question
                answerButtonA.setTitle(currentQuestion.answers[0], for: .normal)
                answerButtonB.setTitle(currentQuestion.answers[1], for: .normal)
                answerButtonC.setTitle(currentQuestion.answers[2], for: .normal)
                answerButtonD.setTitle(currentQuestion.answers[3], for: .normal)
                setNewColors()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNewColors()
        populateQuestion()
        getNewQuestion()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func populateQuestion () {
        let question1 = TriviaQuestion(question: "How it do", answers: ["it do", "It dont", "good", "bad"], correctAnswerIndex: 0)
        let question2 = TriviaQuestion(question: "Who is the NFL all time passing leader", answers: ["peyton manning", "Tom Brady", "Brett Farve", "Drew Brees"], correctAnswerIndex: 3)
        questions = [question1, question2]
    }
    
    
    func getNewQuestion () {
        if questions.count > 0 {
            currentIndex = Int.random(in: 0..<questions.count)
            currentQuestion = questions[currentIndex]
        } else {
            
        }
    }
    
    func showGameOverAlert() {
        let endAlert = UIAlertController(title: "Trivia Results", message: "Game Over! Your score was \(score) out of \(questionPlaceholder.count)", preferredStyle: UIAlertController.Style.alert)
    }
    
    let backgroundColors = [
        UIColor(red: 230/255, green: 2/255, blue: 2/255, alpha: 1.0),
        UIColor(red: 2/255, green: 230/255, blue: 230/255, alpha: 1.0),
        UIColor(red: 0/255, green: 139/255, blue: 113/255, alpha: 1.0),
        UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0),
        UIColor(red: 204/255, green: 103/255, blue: 0/255, alpha: 1.0)
    ]
    func setNewColors() {
        let randomNumber = Int.random(in: 1...100)
        let randomColorA = backgroundColors[randomNumber % 4]
        let randomColorB = backgroundColors[(randomNumber + 1) % 4]
        let randomColorC = backgroundColors[(randomNumber + 2) % 4]
        let randomColorD = backgroundColors[(randomNumber + 3) % 4]
        
        answerButtonA.backgroundColor = randomColorA
        answerButtonB.backgroundColor = randomColorB
        answerButtonC.backgroundColor = randomColorC
        answerButtonD.backgroundColor = randomColorD
    }
    
    @IBAction func answerButtonTapped(_ sender: Any) {
        if currentQuestion.correctAnswerIndex == (sender as AnyObject).tag {
            score += 1
            showCorrectAnswerAlert()
            //need to fill out show correct answer alert
        } else {
            showIncorrectAnswerAlert()
        }
    }
    
    func showCorrectAnswerAlert() {
        let correctAlert = UIAlertController(title: "Correct", message: "\(currentQuestion.correctAnswer) is the correct answer good job", preferredStyle: .actionSheet)
        let okayAction = UIAlertAction(title: "Thank You", style: UIAlertAction.Style.default) { UIAlertAction in
            self.questionPlaceholder.append(self.questions[self.currentIndex])
            self.questions.remove(at: self.currentIndex)
            self.getNewQuestion()
            }
        correctAlert.addAction(okayAction)
        self.present(correctAlert, animated: true, completion: nil)
    }
    
    func showIncorrectAnswerAlert() {
        
    }
    
    
    func resetGame () {
        score = 0
        if questions.isEmpty {
            questionPlaceholder.append(contentsOf: questions)
            questions.removeAll()
        }
        questions = questionPlaceholder
        questionPlaceholder.removeAll()
        getNewQuestion()
    }
    
    
    @IBAction func unwindToQuizVC(segue:UIStoryboardSegue) { }
    
    
    
    
    
    
}






