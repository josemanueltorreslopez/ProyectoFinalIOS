//
//  Datos.swift
//  todopelis
//
//  Created by Antonio y Jose on 20/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//
import UIKit
import FirebaseDatabase

class Datos: UIViewController{
 
    @IBOutlet weak var lb_titulo: UILabel!
    @IBOutlet weak var lb_valoracion: UILabel!
    @IBOutlet weak var txa_sinopsis: UITextView!
    
    var pelicula: Pelicula!
    var serie: Serie!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        txa_sinopsis.layer.borderWidth = 1.0
        txa_sinopsis.layer.borderColor = UIColor.gray.cgColor
        
        
        if (pelicula != nil) {
            lb_titulo.text = pelicula.titulo
            lb_valoracion.text = pelicula.valoracion
            txa_sinopsis.text = pelicula.sinopsis
        } else {
            lb_titulo.text = serie.titulo
            lb_valoracion.text = serie.valoracion
            txa_sinopsis.text = serie.sinopsis
        }
    }
}
