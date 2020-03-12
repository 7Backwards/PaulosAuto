//
//  PaginaInicialScene.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 11/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit

struct Equipamento {
    
    let numeroSerie : String?
    let imagem : UIImage?
    let modelo : String?
    var horasUtilizacao : Int?
}


class PaginaInicialScene: ViewController,UITableViewDelegate, UITableViewDataSource {
    
    let cellSpacingHeight: CGFloat = 5
    var equipamentos = [Equipamento]()
    @IBOutlet weak var equipamentosTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return equipamentos.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
          return cellSpacingHeight
      }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell

        // note that indexPath.section is used rather than indexPath.row
        cell.textLabel!.text = equipamentos[indexPath.row].modelo
        cell.detailTextLabel!.text = equipamentos[indexPath.row].numeroSerie
        cell.imageView?.image = equipamentos[indexPath.row].imagem

        // add border and color
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        

        return cell
    }
    
    override func viewDidLoad() {
        
        equipamentosTable.dataSource = self as? UITableViewDataSource
        equipamentosTable.delegate = self as? UITableViewDelegate
        super.viewDidLoad()
        super.addNavBarLogo()
        super.addNavBarSettings()
        equipamentos = [Equipamento.init(numeroSerie: "FTR00957", imagem: UIImage(named: "5523b3f1cf47c.jpg"), modelo: "CB10", horasUtilizacao: 1400)]
        equipamentos.append(Equipamento.init(numeroSerie: "FDR10765", imagem: UIImage(named: "5523b4949693d.jpg"), modelo: "Empilhador a Gás", horasUtilizacao: 1700))
        
        
    }
    

    
}
