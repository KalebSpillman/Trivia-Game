//
//  TriviaQuestion.swift
//  TriviaGame
//
//  Created by Kaleb Spillman on 10/19/18.
//  Copyright © 2018 Kaleb Spillman. All rights reserved.
//

import Foundation

class TriviaQuestion {
    var question: String
    var answers: [String]
    var correctAnswer: String {
        return answers[correctAnswerIndex]
    }
    var correctAnswerIndex: Int
    
    init(question: String, answers: [String], correctAnswerIndex: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
    
}
