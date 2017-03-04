Rails.application.routes.draw do
  mount RailsAdmin::Engine at: '/', as: 'rails_admin'
end
