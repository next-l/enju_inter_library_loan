Rails.application.routes.draw do
  resources :inter_library_loans
  resources :items do
    resources :inter_library_loans
  end
end
