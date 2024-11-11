//
//  ViewController.swift
//  MoodTracker
//
//  Created by nhat on 11/11/24.
//

import UIKit
import Inject

class ViewController: UIViewController {

    private let moodButton: UIButton = {
          let button = UIButton(type: .system)
          button.setTitle("Tap to Get Your Mood", for: .normal)
          button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
          button.setTitleColor(.white, for: .normal)
          button.backgroundColor = .systemBlue
          button.layer.cornerRadius = 12
          button.translatesAutoresizingMaskIntoConstraints = false
          return button
      }()
      
      private let moodLabel: UILabel = {
          let label = UILabel()
          label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
          label.textAlignment = .center
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
      
      private let moodIconLabel: UILabel = {
          let label = UILabel()
          label.font = UIFont.systemFont(ofSize: 50)
          label.textAlignment = .center
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
      
      // Define moods with text, emoji, and color
      private let moods: [(text: String, icon: String, color: UIColor)] = [
          ("Happy", "😊", .systemYellow),
          ("Sad", "😢", .systemBlue),
          ("Excited", "🤩", .systemPink),
          ("Calm", "😌", .systemTeal),
          ("Angry", "😡", .systemRed),
          ("Surprised", "😮", .systemPurple)
      ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set up the initial background color and layout
        view.backgroundColor = .systemGray6
        setupLayout()
        
        // Add target action for button
        moodButton.addTarget(self, action: #selector(showRandomMood), for: .touchUpInside)
    }

    private func setupLayout() {
        view.addSubview(moodButton)
        view.addSubview(moodLabel)
        view.addSubview(moodIconLabel)
        
        NSLayoutConstraint.activate([
            // Center the button horizontally and vertically
            moodButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moodButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            moodButton.widthAnchor.constraint(equalToConstant: 250),
            moodButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Position the mood icon above the button
            moodIconLabel.bottomAnchor.constraint(equalTo: moodButton.topAnchor, constant: -20),
            moodIconLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Position the mood label above the icon
            moodLabel.bottomAnchor.constraint(equalTo: moodIconLabel.topAnchor, constant: -10),
            moodLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func showRandomMood() {
       // Select a random mood
       let mood = moods.randomElement()!
       
       // Update the label, icon, and background color
       moodLabel.text = mood.text
       moodIconLabel.text = mood.icon
       view.backgroundColor = mood.color
       
       // Add some button animation
       UIView.animate(withDuration: 0.2, animations: {
           self.moodButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
       }) { _ in
           UIView.animate(withDuration: 0.2) {
               self.moodButton.transform = CGAffineTransform.identity
           }
       }
    }
}

func injectedViewController(_ creator: @escaping @autoclosure () -> UIViewController) -> UIViewController {
    #if DEBUG
    return Inject.ViewControllerHost(creator())
    #else
    return creator()
    #endif
}

