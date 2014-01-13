class SitepagesController < ApplicationController
    
    def home
        
    end
    
    def about
        
    end
    
    def contact
        
    end
    
    def manga
        
    end
    
    def media
        
    end
    
    def about
        
    end
    
    def services
        
    end
    
    def store
       @commissions = Item.find_all_by_category("Commission")
      @mangas = Item.find_all_by_category("Manga")
      @artworks = Item.find_all_by_category("Artwork") 
    end
    
end
