//
//  DatosPelis.swift
//  todopelis
//
//  Created by Antonio y Jose on 18/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DatosPelis: UIViewController{
    @IBOutlet weak var lb_titulo: UILabel!
    
    @IBOutlet weak var lb_Valoracion: UILabel!
    @IBOutlet weak var txa_Sinopsis: UITextView!
    
    var pelicula = Pelicula(titulo: "", sinopsis: "", valoracion: "", genero: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()/*
        txa_Sinopsis.layer.borderWidth = 1.0
        txa_Sinopsis.layer.borderColor = UIColor.gray.cgColor
        
        lb_titulo.text = pelicula.titulo ?? "as"
        lb_Valoracion.text = pelicula.valoracion ?? "ass"
        txa_Sinopsis.text = pelicula.sinopsis ?? "asss"
    */}
}
