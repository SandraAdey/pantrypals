# config/initializers/openai.rb

require 'openai'

OpenAI.configure do |config|
  config.access_token = ENV['OPENAI_API_KEY']
  # Optionally, you can set other configurations like the organization ID or request timeout.
  # config.organization_id = ENV['OPENAI_ORG_ID']
  # config.request_timeout = 120 # Optional
end
