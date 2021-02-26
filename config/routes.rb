Rails.application.routes.draw do
  get 'genealogys/new'
  get 'genealogys/create'
  get 'genealogys/index'
  get 'genealogys/show'
  get 'genealogys/edit'
  get 'genealogys/update'
  get 'genealogys/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users do
    resources :families do
      get :genealogy_diagram, on: :member
      resources :members do
        get :infor_children, on: :collection
        get :new_relationship, on: :member
        get :create_relationship, on: :member
      end
    end
  end
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end
  root :to => 'genealogys#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
