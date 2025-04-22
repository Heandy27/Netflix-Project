import Foundation
import UIKit
import CoreData

class DataPersistenceManager {
    
    
    enum DataBaseError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    static let shared = DataPersistenceManager()
    
    func downloadTitle(with model: Title, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDeledate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        
        let context = appDeledate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        // Asignamos los datos obtenidos por la api y se les asignamos al coreData items
        item.title = model.title
        item.id = Int64(model.id)
        item.original_title = model.original_title
        item.overview = model.overview
        item.media_type = model.media_type
        item.poster_path = model.poster_path
        item.release_date = model.release_date
        item.vote_count = Int64(model.vote_count ?? 0)
        item.vote_average = model.vote_average ?? 0
        
        // Guardamos en el context del coreData y colocamos el completion que creamos
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DataBaseError.failedToSaveData))
        }
    }
    
    
    func fetchingTitlesFromDataBase(completion: @escaping (Result<[TitleItem], Error>) ->Void) {
        guard let appDeledate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        
        let context = appDeledate.persistentContainer.viewContext
        
        let request: NSFetchRequest<TitleItem>
        
        request = TitleItem.fetchRequest()
        
        do {
           let titles = try context.fetch(request)
            completion(.success(titles))
        } catch {
            completion(.failure(DataBaseError.failedToFetchData))
        }
    }
    
    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void,Error>) -> Void) {
        guard let appDeledate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        
        let context = appDeledate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DataBaseError.failedToDeleteData))
        }
    }
}
