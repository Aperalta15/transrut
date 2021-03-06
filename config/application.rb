require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Transrut
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales','**', '*.{rb,yml}').to_s]

    config.i18n.default_locale = :"es-CO"

    config.i18n.enforce_available_locales = false
    config. preload_frameworks = true

    config.to_prepare do
      Devise::SessionsController.layout "empty"
      Devise::PasswordsController.layout "empty"
      Devise::PasswordsController.layout "empty"
      Devise::ConfirmationsController.layout "empty"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "empty" }
      # Or to configure mailer layout
      # Devise::Mailer.layout "email" # email.haml or email.erb
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
