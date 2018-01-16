//
//  ViewController.swift
//  Animaciones
//
//  Created by Jorge MR on 22/06/17.
//  Copyright © 2017 Jorge MR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botonIniciar: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var i : Int = 0
    var timer = Timer()
    var animado : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Desvanecer(_ sender: Any) {
        imageView.alpha = 1
        UIView.animate(withDuration: 3) {
            self.imageView.alpha = 0
        }
    }
    
    @IBAction func Deslizar(_ sender: Any) {
        imageView.center = CGPoint(x: imageView.center.x - 500, y: imageView.center.y)
        
        UIView.animate(withDuration: 2){
           self.imageView.center = CGPoint(x: self.imageView.center.x+500, y: self.imageView.center.y)
        }
    }
    
    @IBAction func Agrandar(_ sender: Any) {
        //Coordenadas de inicio de la Imagen
        //Frame es con respecto a la superview
        //Bounds es con respecto a su propio sistema de coordenadas
        let x = imageView.frame.origin.x
        let y = imageView.frame.origin.y
        //Tamaño original de la imagen
        let ancho = imageView.frame.width
        let alto = imageView.frame.height
        
        imageView.frame = CGRect(x: x, y: y, width: 0, height: 0)
        
        UIView.animate(withDuration: 2) { 
            self.imageView.frame = CGRect(x: x, y: y, width: ancho, height: alto)
        }
        
    }
    
    @IBAction func siguiente(_ sender: Any) {
        if animado == false {
        timer = Timer.scheduledTimer(timeInterval: 0.04, target: self, selector: #selector(ViewController.animar), userInfo: nil, repeats: true)
            botonIniciar.setTitle("Detener", for: [])
            botonIniciar.setTitleColor(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), for: [])
            animado = true
        } else {
            animado = false
            botonIniciar.setTitle("Iniciar", for: [])
            botonIniciar.setTitleColor(#colorLiteral(red: 0.0119239362, green: 0.4746654034, blue: 0.9847092032, alpha: 1), for: [])
            timer.invalidate()
        }
    }
    
    func animar(){
        if i<71{
            i+=1
        }else{
            i=0
        }
        print(i)
        imageView.image = UIImage(named: "frame_\(i)_delay-0.04s.gif")
    }

}

