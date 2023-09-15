//
//  ViewController.swift
//  
//  
//  Created by m.ishiyama on 2023/09/13
//  
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedContainer: UIView!
    @IBOutlet weak var movingUnderLine: UIView!
    @IBOutlet weak var contentContainer: UIView!
    
    var contentViews = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentViews()
        updateContentViewVisibility(index: 0)
    }
    
    func setupContentViews() {
        contentViews = [
            createContentView(color: .red),
            createContentView(color: .blue),
            createContentView(color: .yellow)
        ]
    }
    
    func createContentView(color: UIColor) -> UIView {
        let contentView = UIView(frame: contentContainer.bounds)
        contentView.backgroundColor = color
        contentContainer.addSubview(contentView)
        contentView.isHidden = true
        return contentView
    }
    
    func updateContentViewVisibility(index: Int) {
        for (idx, view) in contentViews.enumerated() {
            // MARK: この書き方は面白い
            view.isHidden = idx != index
        }
        animateMovingUnderLine(to: index)
    }
    
    func animateMovingUnderLine(to index: Int) {
        let buttonWidth = segmentedContainer.frame.width / CGFloat(contentViews.count)
        let xOffset = CGFloat(index) * buttonWidth
        UIView.animate(withDuration: 0.3) {
            self.movingUnderLine.frame.origin.x = xOffset
        }
    }

    @IBAction func firstButtonTapped(_ sender: UIButton) {
        updateContentViewVisibility(index: 0)
    }
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        updateContentViewVisibility(index: 1)
    }
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        updateContentViewVisibility(index: 2)
    }
}
