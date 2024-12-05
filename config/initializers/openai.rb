OpenAI.configure do |config|
  config.access_token = ENV.fetch("OPENAI_API_KEY")
  config.log_errors = ENV.fetch("OPENAI_LOG_ERRORS", false) === "true" # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production because it could leak private data to your logs.
end
