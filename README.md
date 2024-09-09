# Rails LaunchPad :rocket:

A template for quickly bootstrapping new Rails APIs. This is strictly based on my own preferences, what I like to start with and how I like to have certain things structured.

## Gems Included :gem:

This template comes pre-loaded with the following gems:

- **Rails (v7.1.4)**
- **PostgreSQL (v1.1)**
- **Puma (v5.0+)**
- **JSONAPI-Serializer**
- **image_processing (v1.2)**
- **Rack-CORS**
- **Devise**
- **Devise-JWT**
- **Standard**
- **Dotenv-Rails**
- **Letter Opener (dev)**
- **Annotate (dev)**

## Getting Started :clipboard:

To use this template, follow these steps:

1. Clone the repository:
   ```sh
   git clone https://github.com/basilmeer/rails-launchpad.git
   ```
2. Change into the project directory:
   ```sh
   cd rails-launchpad
   ```
3. Install dependencies:
   ```sh
   bundle install
   ```
4. Set up your database:
   ```sh
   rails db:create db:migrate
   ```
5. Start the server:
   ```sh
   rails server
   ```

Or you can generate a new project using

```sh
$ rails new PROJECT_NAME --api --database=postgresql -m https://github.com/basilmeer/rails-launchpad.git
```

And you should be good to go.

## Customization :pencil:

Feel free to customize this template to fit your specific needs. It is tailored to my own preferences but you can add or remove gems, adjust configuration settings, and modify the codebase as necessary.

## Contributing :raised_hands:

If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request. Contributions are always welcome.
