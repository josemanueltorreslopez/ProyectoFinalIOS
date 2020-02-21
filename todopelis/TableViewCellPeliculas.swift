//
//  TableViewCellPeliculas.swift
//  todopelis
//
//  Created by Antonio y Jose on 11/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TableViewCellPeliculas: UITableViewCell {
    
    @IBOutlet weak var lb_titulo: UILabel!
    @IBOutlet weak var bt_Informacion: UIButton!
    @IBOutlet weak var bt_Favoritos: UIButton!
    
    var pelicula = Pelicula(
        titulo: "",
        sinopsis: "",
        valoracion: "",
        genero: "",
        favorito: "",
        key: ""
    )
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }
    
    @IBAction func pasarInformacion(_ sender: Any) {
        PeliculasVista.pelicula = pelicula
    }
    @IBAction func act_Favoritos(_ sender: Any) {
        let ref = Database.database().reference().child("Peliculas").child(pelicula.genero).child(pelicula.key)
                   
               if (pelicula.favorito == "0") {
                  ref.updateChildValues(["favorito": "1"])
               } else {
                   ref.updateChildValues(["favorito": "0"])
               }
    }
    
}
