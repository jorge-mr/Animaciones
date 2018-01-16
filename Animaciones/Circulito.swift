//
//  Circulito.swift
//  Animaciones
//
//  Created by Jorge MR on 22/06/17.
//  Copyright © 2017 Jorge MR. All rights reserved.
//

import UIKit

class Circulito: UIViewController {

    @IBOutlet weak var circulo: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func mueveFigura(_ sender: Any) {
       circulo.center = CGPoint(x: circulo.center.x, y: circulo.center.y)
        let minXScreen = self.view.bounds.minX
        let maxXScreen = self.view.bounds.maxX
        let minYScreen = self.view.bounds.minY
        let maxYScreen = self.view.bounds.maxY
        let newX = randomInt(min: Int(minXScreen), max: Int(maxXScreen))
        let newY = randomInt(min: Int(minYScreen), max: Int(maxYScreen))
        UIView.animate(withDuration: 0.7) {
//            self.circulo.tintColor = UIColor(colorLiteralRed: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            self.circulo.center = CGPoint(x: newX, y: newY)
        }
 
    }
    
    func randomInt(min: Int, max:Int) -> Int {
        let rand = min + Int(arc4random_uniform(UInt32(max - min)))
        print("random entre \(min) y \(max) es: \(rand)")
        return rand
    }
    
    @IBAction func regresar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
