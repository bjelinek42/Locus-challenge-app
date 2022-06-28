Rails.application.routes.draw do
  root 'task_lists#index'

  resources :task_lists, except: :show do
    resources :tasks, except: :show
  end

  #I assume I could also remove the "except: :show" part as well as what I put below

  get "/task_lists/:id" => "task_lists#show"
  patch "/task_lists/:id" => "task_lists#update"
end
