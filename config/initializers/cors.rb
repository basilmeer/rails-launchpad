Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "localhost", "127.0.0.1"

    resource "*",
      headers: :any,
      expose: ['Authorization'],
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
