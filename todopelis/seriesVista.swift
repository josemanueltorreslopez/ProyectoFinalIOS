//
//  SeriesVista.swift
//  todopelis
//
//  Created by Antonio y Jose on 10/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SeriesVista: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tb_Series: UITableView!

    var lista:[Array<Serie>] = []
    var generos:[String] = []
    
    static var serie = Serie(titulo: "", sinopsis: "", valoracion: "", genero: "", favorito: "", key: "")
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellSeries = tableView.dequeueReusableCell(withIdentifier: "series",   for : indexPath) as! TableViewCellSeries

        cellSeries.lb_TituloSerie.text = lista[indexPath.section][indexPath.row].titulo
        
        cellSeries.serie = Serie(
                   titulo: lista[indexPath.section][indexPath.row].titulo,
                   sinopsis: lista[indexPath.section][indexPath.row].sinopsis,
                   valoracion: ("Valoracion: " + lista[indexPath.section][indexPath.row].valoracion),
                   genero: lista[indexPath.section][indexPath.row].genero,
                favorito: lista[indexPath.section][indexPath.row].favorito,
        key: lista[indexPath.section][indexPath.row].key )

        if(cellSeries.serie.favorito.elementsEqual("1")){
            cellSeries.but_Favoritos.setImage(UIImage(systemName: "heart.fill"), for: [])
        }else{
            cellSeries.but_Favoritos.setImage(UIImage(systemName: "heart"), for: [])
        }
        
        return cellSeries
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

        let refGeneros = Database.database().reference().child("Series")

        refGeneros.observe(.value, with: { (snapshot) in
            self.lista = []
            self.generos = []
            
            for child in snapshot.children {

                let snap = child as! DataSnapshot
                let genero = snap.key

                self.generos.append(genero)
                
                var listaSeries: Array<Serie> = []
                    
                for childs in snap.children {

                    let snap2 = childs as! DataSnapshot
                    let serie = snap2.value as! [String: Any]

                    listaSeries.append(
                    Serie(
                    titulo: serie["titulo"] as? String ?? "",
                    sinopsis: serie["sinopsis"] as? String ?? "",
                    valoracion: serie["valoracion"] as? String ?? "",
                    genero: genero,
                    favorito: serie["favorito"] as? String ?? "",
                    key: snap2.key)
                    )

                    
                }
                self.lista.append(listaSeries)
                self.tb_Series.reloadData()
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "datos_Series"){
     
            let datosSeries = segue.destination as! Datos
        
            datosSeries.serie = SeriesVista.serie
        }
    }
    
}
