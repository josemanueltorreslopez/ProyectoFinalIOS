//
//  PeliculasVista.swift
//  todopelis
//
//  Created by Antonio y Jose on 10/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PeliculasVista: UIViewController, UITableViewDataSource {
   
    @IBOutlet weak var tb_Peliculas: UITableView!
    static var pelicula = Pelicula(titulo: "", sinopsis: "", valoracion: "", genero: "", favorito: "", key: "")
    
    var lista:[Array<Pelicula>] = []
    var generos:[String] = []
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellPeliculas = tableView.dequeueReusableCell(withIdentifier: "pelicula", for : indexPath) as! TableViewCellPeliculas
        
        cellPeliculas.lb_titulo?.text = lista[indexPath.section][indexPath.row].titulo
        
        cellPeliculas.pelicula = Pelicula(
            titulo: lista[indexPath.section][indexPath.row].titulo,
            sinopsis: lista[indexPath.section][indexPath.row].sinopsis,
            valoracion: ("Valoracion: " + lista[indexPath.section][indexPath.row].valoracion),
            genero: lista[indexPath.section][indexPath.row].genero,
            favorito: lista[indexPath.section][indexPath.row].favorito,
            key: lista[indexPath.section][indexPath.row].key)
        
        if(cellPeliculas.pelicula.favorito.elementsEqual("1")){
            cellPeliculas.bt_Favoritos.setImage(UIImage(systemName: "heart.fill"), for: [])
        }else{
            cellPeliculas.bt_Favoritos.setImage(UIImage(systemName: "heart"), for: [])
        }
        
        return cellPeliculas
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return generos[section]
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return generos.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let refGeneros = Database.database().reference().child("Peliculas")
        
        refGeneros.observe(.value, with: { (snapshot) in
        self.lista = []
        self.generos = []
            
        for child in snapshot.children {
            
            let snap = child as! DataSnapshot
            let genero = snap.key
            
            self.generos.append(genero)
            
            var listaPeliculas: Array<Pelicula> = []
            
            for childs in snap.children {
                
                let snap2 = childs as! DataSnapshot
                let pelicula = snap2.value as! [String: Any]
                
                listaPeliculas.append(
                    Pelicula(
                        titulo: pelicula["titulo"] as? String ?? "",
                        sinopsis: pelicula["sinopsis"] as? String ?? "",
                        valoracion: pelicula["valoracion"] as? String ?? "",
                        genero: genero,
                        favorito: pelicula["favorito"] as? String ?? "",
                        key: snap2.key)
                    )
            }
            
            self.lista.append(listaPeliculas)
            self.tb_Peliculas.reloadData()
        }})
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "datos_Peliculas"){
         
            let datosPelis = segue.destination as! Datos
            
            datosPelis.pelicula = PeliculasVista.pelicula
        }
    }
}
