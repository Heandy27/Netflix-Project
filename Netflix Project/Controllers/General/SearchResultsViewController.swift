//
//  SearchResultsViewController.swift
//  Netflix Project
//
//  Created by Andy Heredia on 4/4/25.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    public var titles: [Title] = []
    
    public let searchResultsCollectionView: UICollectionView = {
        // Se crea un diseño para la colección
        let layout = UICollectionViewFlowLayout()
        // Se establece el tamaño de los ítems (celdas)
        // UIScreen.main.bounds quiere decir ajustate a toda la pantalla en anchura
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        // Se crea el UICollectionView con el layout definido
        //frame: .zero → Inicializa la vista con un tamaño de 0x0 (luego se ajustará con Auto Layout o un frame).
        //Usa el layout que creamos antes para definir cómo se mostrarán las celdas.
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        
        view.addSubview(searchResultsCollectionView)
        
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultsCollectionView.frame = view.bounds
    }
    

}


extension SearchResultsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        let title = titles[indexPath.row]
        cell.configure(with: title.poster_path ?? "")
        return cell
    }
    
}
