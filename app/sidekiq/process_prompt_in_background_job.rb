class ProcessPromptInBackgroundJob
  include Sidekiq::Job

  def perform(prompt_id, email)
    # TODO: Handle errors of creating completion
    prompt = Prompt.find(prompt_id)
    response = PromptsService.create_completion(name: prompt.name, content: prompt.content)

    prompt.response.attributes = { content: response, status: :completed }
    prompt.response.save

    PromptMailer.with(prompt: prompt, email: email).response_notification.deliver_now
  end
end
