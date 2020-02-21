//
//  Pelicula.swift
//  todopelis
//
//  Created by Antonio y Jose on 10/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import Foundation

class Pelicula {
    var titulo: String
    var sinopsis: String
    var valoracion: String
    var genero: String
    var favorito: String
    var key: String
    
    init(titulo: String, sinopsis: String, valoracion: String, genero: String, favorito: String, key: String) {
        self.titulo = titulo
        self.sinopsis = sinopsis
        self.valoracion = valoracion
        self.genero = genero
        self.favorito = favorito
        self.key = key
    }
}
