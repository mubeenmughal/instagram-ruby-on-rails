# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  address: ENV['address'],
  port: ENV['port'],
  domain: ENV['domain'],
  user_name: ENV['user_name'],
  password: ENV['password'],
  authentication: 'plain',
  enable_starttls_auto: true
}
# => "123"
# => "345"
Rails.application.credentials.secret_key_base
