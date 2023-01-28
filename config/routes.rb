Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :glossaries do
        # resources :term, only: [:new,:create]
        member do
          post 'term' => 'glossaries#create_term'
        end
      end
      resources :term, only: [:new,:create,:index,:show]
      resources :translation
    end
  end
end
