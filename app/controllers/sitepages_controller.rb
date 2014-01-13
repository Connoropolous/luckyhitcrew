class SitepagesController < ApplicationController
    
    def home
      @slides = Slide.order("id")
      @updates = Update.order("created_at DESC").limit(3)
    end
    
    def about
        
    end
    
    def contact
        
    end
    
    def manga
        
    end
    
    def media
      @videos = Video.order("created_at DESC")
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
