//
//  SeriesYPelisFavView.swift
//  todopelis
//
//  Created by Antonio y Jose on 12/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import UIKit

class SeriesYPelisFavVista: UIViewController, UITableViewDataSource {
    
    var listaSeries: Array<Serie> = []
    var listaPeliculas: Array<Pelicula> = []
    let titulos:[String] =
    ["Peliculas","Series"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellSeries = tableView.dequeueReusableCell(withIdentifier: "series", for : indexPath) as! TableViewCellSeries
        //cell.lbJuegos?.text = listaJuegos[indexPath.row].titulo
        
        /*cell.videojuego = Videojuegos(titulo: listaJuegos[indexPath.row].titulo,
            sinopsis: listaJuegos[indexPath.row].sinopsis,
            pegi: listaJuegos[indexPath.row].pegi,
            valoracion: listaJuegos[indexPath.row].valoracion,
            distribuidor: listaJuegos[indexPath.row].distribuidor,
            key: listaJuegos[indexPath.row].key)*/
        
        return cellSeries
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
