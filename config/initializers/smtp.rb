ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  domain: 'linmurproject.one',
  user_name: ENV['sendgrid_username'],
  password: ENV['sendgrid_password'],
  authentication: :login,
  enable_starttls_auto: true
}