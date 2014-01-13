Luckyhitcrew::Application.routes.draw do
  
  devise_for :admins

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'sitepages#home'
  
  match '404', :to => 'errors#not_found'
  
  match 'services' => 'sitepages#services'
  match 'store' => 'sitepages#store'
  match 'media' => 'sitepages#media'
  match 'contact' => 'sitepages#contact'
  match 'about' => 'sitepages#about'
  
  resources :videos
  resources :pagetexts, except: :show
  resources :slides, except: [:show, :new, :create, :destroy]
  resources :items, except: :index
  resources :links, except: :show
  resources :blogs
  resources :updates
  resources :pages
  
  get     'mangas/:manga_id/chapters(.:format)'               => 'chapters#index',  :as => :manga_chapters
  post    'mangas/:manga_id/chapters(.:format)'               => 'chapters#create'
  get     'mangas/:manga_id/chapters/new(.:format)'           => 'chapters#new',    :as => :new_manga_chapter   
  get     'mangas/:manga_id/chapters/:id/edit(.:format)'      => 'chapters#edit',   :as => :edit_manga_chapter
  get     'mangas/:manga_id/chapters/:id(.:format)'           => 'chapters#show',   :as => :manga_chapter
  put     'mangas/:manga_id/chapters/:id(.:format)'           => 'chapters#update'
  delete  'mangas/:manga_id/chapters/:id(.:format)'           => 'chapters#destroy'

  get     'mangas(.:format)'                                  => 'mangas#index',  :as => :mangas
  post    'mangas(.:format)'                                  => 'mangas#create'
  get     'mangas/new(.:format)'                              => 'mangas#new',    :as => :new_manga   
  get     'mangas/:id_or_slug/edit(.:format)'                 => 'mangas#edit',   :as => :edit_manga
  get     'mangas/:id_or_slug(.:format)'                      => 'mangas#show',   :as => :manga
  put     'mangas/:id_or_slug(.:format)'                      => 'mangas#update'
  delete  'mangas/:id_or_slug(.:format)'                      => 'mangas#destroy'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
