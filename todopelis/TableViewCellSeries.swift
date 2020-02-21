//
//  TableViewCellSeries.swift
//  todopelis
//
//  Created by Antonio y Jose on 11/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//


import UIKit
import FirebaseDatabase

class TableViewCellSeries: UITableViewCell {
    
    @IBOutlet weak var lb_TituloSerie: UILabel!
    @IBOutlet weak var but_Informacion: UIButton!
    @IBOutlet weak var but_Favoritos: UIButton!
    
    
    
    var serie = Serie(titulo: "", sinopsis: "", valoracion: "", genero: "", favorito: "", key: "")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }
    @IBAction func pasar_Datos(_ sender: Any) {
        SeriesVista.serie = serie
    }
    
    @IBAction func act_Favoritos(_ sender: Any) {
        let ref = Database.database().reference().child("Series").child(serie.genero).child(serie.key)
            
        if (serie.favorito == "0") {
           ref.updateChildValues(["favorito": "1"])
            
        } else {
            ref.updateChildValues(["favorito": "0"])
        }
    }
    
}
