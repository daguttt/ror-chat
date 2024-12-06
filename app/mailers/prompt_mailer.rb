class PromptMailer < ApplicationMailer
  def response_notification
    @prompt = params[:prompt]
    email = params[:email]
    mail(to: email, subject: "Tu respuesta se ha procesado con éxito")
  end
end
