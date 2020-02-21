//
//  FavoritosVista.swift
//  todopelis
//
//  Created by Antonio y Jose on 17/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FavoritosVista: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tb_Favoritos: UITableView!
    
    static var pelicula = Pelicula(titulo: "", sinopsis: "", valoracion: "", genero: "", favorito: "", key: "")
    
    var lista:[Array<Pelicula>] = []
    var generos:[String] = ["Peliculas","Series"]
    var listaPeliculas: Array<Pelicula> = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.lista.count == 2) {
            
            return self.lista[section].count
        } else {
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellFavoritas = tableView.dequeueReusableCell(withIdentifier: "favoritos", for : indexPath) as! TableViewCellFavoritos
        
        cellFavoritas.lb_Titulo.text = lista[indexPath.section][indexPath.row].titulo
        
        return cellFavoritas
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return generos[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return generos.count
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
                
        let refGeneros = Database.database().reference()
        refGeneros.observe(.value, with: { (snapshot) in
            
            self.lista = []
            
            for child0 in snapshot.children {
                
                let snap0 = child0 as! DataSnapshot
                self.listaPeliculas = []
                
                for child1 in snap0.children {
                    
                    let snap1 = child1 as! DataSnapshot
                    let genero = snap1.key
                    
                    for child3 in snap1.children {
                        
                        let snap2 = child3 as! DataSnapshot
                        let pelicula = snap2.value as! [String: Any]
                        
                        if ((pelicula["favorito"] as? String)?.elementsEqual("1") ?? false) {
                            
                            self.listaPeliculas.append(
                                Pelicula(
                                    titulo: pelicula["titulo"] as? String ?? "",
                                    sinopsis: pelicula["sinopsis"] as? String ?? "",
                                    valoracion: pelicula["valoracion"] as? String ?? "",
                                    genero: genero,
                                    favorito: pelicula["favorito"] as? String ?? "",
                                    key: snap2.key
                                )
                            )
                        }
                    }
                    
                }
                
                self.lista.append(self.listaPeliculas)
                self.tb_Favoritos.reloadData()
            }
        })
        
    }
}
