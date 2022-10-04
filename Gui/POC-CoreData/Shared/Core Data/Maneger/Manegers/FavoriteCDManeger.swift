/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import CoreData


class FavoriteCDManager {
    
    /* MARK: - Atributos */
    
    /// Salva os alimentos que estão favoritadas
    private lazy var favoriteFoodCache: [NSManagedObjectID] = []
    
    /// Salva as hortas que estão favoritadas
    private lazy var favoriteGardenCache: [NSManagedObjectID] = []
    
    
    /// Protocolo do core data
    public weak var coreDataProperties: CoreDataProperties?
    
    
    
    /* MARK: - Encapsulamento */
    
    /* Alimentos */
    
    public func getAllFavoriteFood() -> [NSManagedObjectID] {
        return self.favoriteFoodCache
    }
    
    
    public func addNewFavoriteFood(for data: Food) {
        self.favoriteFoodCache.append(data.objectID)
    }
    
    
    public func removeFavoriteFood(for data: Food) {
        for ind in 0..<self.favoriteFoodCache.count {
            if self.favoriteFoodCache[ind] == data.objectID {
                self.favoriteFoodCache.remove(at: ind)
                break
            }
        }
    }
    
    
    
    /* Hortas */
    
//    public func getAllFavoriteGarden() -> [NSManagedObjectID] {
//        return self.favoriteGardenCache
//    }
//
//
//    public func addNewFavoriteGarden(for data: Garden) {
//        self.favoriteGardenCache.append(data.objectID)
//    }
//
//
//    public func removeFavoriteGarden(for data: Garden) {
//        for ind in 0..<self.favoriteGardenCache.count {
//            if self.favoriteGardenCache[ind] == data.objectID {
//                self.favoriteGardenCache.remove(at: ind)
//                break
//            }
//        }
//    }
}
