# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://elegant-cascaron-fb6a74.netlify.app", "https://businesstrackerapp.azurewebsites.net"

    resource "*",
      headers: :any,
      credentials: true,
      methods: [:get, :post, :patch, :delete]
  end
end

# :put, :patch, :delete, :options, :head]
# http://localhost:3001