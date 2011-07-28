GoSeite::Application.routes.draw do 
	#root :to => {:controller => "forum_threads",:action => "bla"}
	root :to => 'forum_threads#news'
  devise_for :users

	resources :german_go_leagues

  get "tournament_players/teilnehmer" => "tournament_players#teilnehmer"
  delete "tournament_players/destroy_all"
  resources :tournament_players

  get "tournament_results/:id/:player/edit" => "tournament_results#edit"
  delete "tournament_results/destroy_all"
  delete "tournament_results/destroy"
  resources :tournament_results, :except =>  [:edit,:update,:destroy] 

  constraints(:id => /[0-9]+/) do
    resources :tournament_informations, :except => [:show]
  end
    
  constraints(:id => /[A-Z][a-z]+/) do
    get "tournament_informations/:id/ausschreibung" => "tournament_informations#ausschreibung"
		get "tournament_informations/ausschreibung"
    get "tournament_informations/:id/anfahrt" => "tournament_informations#anfahrt"
		get "tournament_informations/anfahrt"
    get "tournament_informations/:id/kontakt" => "tournament_informations#kontakt"
		get "tournament_informations/kontakt"
  end
		
  
  resources :forum_posts, :except =>  [:new, :index,:show] 
  resources :forum_threads, :except =>  [:new, :index] 
  resources :forum_areas 
  get "forum_posts/:id/new" => "forum_posts#new"
  get "forum_threads/:id/new" => "forum_threads#new"
  get "forum_threads/:id/show" => "forum_threads#show"

  get "user/:id/edit_pass" => "user#edit_pass"
	get "user/profil"
  resources :user

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
  # match ':controller(/:action(/:id(.:format)))'
end
