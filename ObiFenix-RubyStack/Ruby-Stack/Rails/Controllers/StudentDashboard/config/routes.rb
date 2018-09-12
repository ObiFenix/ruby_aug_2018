Rails.application.routes.draw do

  # root 'dojo#index'
  root 'sessions#index'
  get 'sessions/sw' => 'sessions#switch'
  post 'sessions/register' => 'sessions#register'
  post 'sessions/login' => 'sessions#login'
  delete 'logout' => 'sessions#logout'

  resources :dojo do
    resources :managers
    resources :students
  end
end


# Prefix            Verb      URI Pattern                                Controller#Action
# ========================================================================================
# root              GET       /                                          sessions#index
# sessions_sw       GET       /sessions/sw(.:format)                     sessions#switch
# sessions_register POST      /sessions/register(.:format)               sessions#register
# sessions_login    POST      /sessions/login(.:format)                  sessions#login
#      logout       DELETE    /logout(.:format)                          sessions#logout
# ---------------------------------------------------------------------- [ MANAGER ROUTES ]
# dojo_managers     GET       /dojo/:dojo_id/managers(.:format)          managers#index
#                   POST      /dojo/:dojo_id/managers(.:format)          managers#create
# new_dojo_manager  GET       /dojo/:dojo_id/managers/new(.:format)      managers#new
# edit_dojo_manager GET       /dojo/:dojo_id/managers/:id/edit(.:format) managers#edit
# dojo_manager      GET       /dojo/:dojo_id/managers/:id(.:format)      managers#show
#                   PATCH     /dojo/:dojo_id/managers/:id(.:format)      managers#update
#                   PUT       /dojo/:dojo_id/managers/:id(.:format)      managers#update
#                   DELETE    /dojo/:dojo_id/managers/:id(.:format)      managers#destroy
# ---------------------------------------------------------------------- [ STUDENT ROUTES ]
# dojo_students     GET       /dojo/:dojo_id/students(.:format)          students#index
#                   POST      /dojo/:dojo_id/students(.:format)          students#create
# new_dojo_student  GET       /dojo/:dojo_id/students/new(.:format)      students#new
# edit_dojo_student GET       /dojo/:dojo_id/students/:id/edit(.:format) students#edit
# dojo_student      GET       /dojo/:dojo_id/students/:id(.:format)      students#show
#                   PATCH     /dojo/:dojo_id/students/:id(.:format)      students#update
#                   PUT       /dojo/:dojo_id/students/:id(.:format)      students#update
#                   DELETE    /dojo/:dojo_id/students/:id(.:format)      students#destroy
# ---------------------------------------------------------------------- [ DOJO ROUTES ]
# dojo_index        GET       /dojo(.:format)                            dojo#index
#                   POST      /dojo(.:format)                            dojo#create
# new_dojo          GET       /dojo/new(.:format)                        dojo#new
# edit_dojo         GET       /dojo/:id/edit(.:format)                   dojo#edit
# dojo              GET       /dojo/:id(.:format)                        dojo#show
#                   PATCH     /dojo/:id(.:format)                        dojo#update
#                   PUT       /dojo/:id(.:format)                        dojo#update
#                   DELETE    /dojo/:id(.:format)                        dojo#destroy
# ========================================================================================
