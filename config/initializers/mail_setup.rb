# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  address: Rails.application.credentials.mailer[:address],
  port: Rails.application.credentials.mailer[:port],
  domain: Rails.application.credentials.mailer[:domain],
  user_name: Rails.application.credentials.mailer[:user_name],
  password: Rails.application.credentials.mailer[:password],
  authentication: 'plain',
  enable_starttls_auto: true
}
    # => "123"
# => "345"
Rails.application.credentials.secret_key_base
