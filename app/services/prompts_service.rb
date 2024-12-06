class PromptsService
  def self.create_completion(name:, content:)
    prompt = <<~HEREDOC
      Generate a response for the prompt that follows always in HTML using the
      appropriate tags depending on the requested content but without <html>, <head>
      nor <body> tags.
      Example 1:
      Prompt: 'Genera un hola mundo en Python'
      Response: '<pre>print("Hola Mundo")</pre>'

      Example 2:
      Prompt: 'What's the most famous editor for Java?'
      Response: '<p>The most famous editor for Java is IntelliJ IDEA.</p>'

      ---

      Prompt: '#{content}'.

      The name/title of the prompt is the following (do not include it on the response): '#{name}'.
      You should consider the name/title as context when processing the response if it makes sense along with the prompt.
    HEREDOC

    client = OpenAI::Client.new

    # TODO: Handle Faraday Errors
    prompt_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          {
            role: "system", content: "You are a helpful assistant."
          },
          {
            role: "user",
            content: prompt
          }
        ],
        temperature: 0.6,
        max_completion_tokens: 100
      }
    )

    prompt_response.dig("choices", 0, "message", "content")
  end
end
