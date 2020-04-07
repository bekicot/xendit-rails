Rails.application.routes.draw do
  mount Xendit::Rails::Engine => "/xendit-rails"
end
