Rails.application.routes.draw do
  # Accsess from CoderdojoBook
  get '/sotech_sha/:chapter', to: 'sotech_sha#index'

  # Default Scrivito routes. Adapt them to change the routing of CMS objects.
  # See the documentation of 'scrivito_route' for a detailed description.
  scrivito_route '/', using: 'homepage'
  scrivito_route '(/)(*slug-):id', using: 'slug_id'
  scrivito_route '/*permalink', using: 'permalink', format: false
end
