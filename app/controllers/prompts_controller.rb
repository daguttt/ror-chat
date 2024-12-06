class PromptsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :prompt_not_found

  # GET /prompts
  def index
    @prompts = Prompt.all
  end

  # GET /prompts/new
  def new
    @prompt = Prompt.new
  end

  # POST /prompts
  def create
    params = prompt_params
    params.delete(:email) if params[:email]
    @prompt = Prompt.new(params)

    unless @prompt.save
      return render :new, status: :unprocessable_entity
    end


    if @prompt.processed_in_job
      # Schedule the job to generate the response
      email = prompt_params[:email]
      ProcessPromptInBackgroundJob.perform_async(@prompt.id email)
      @prompt.create_response(status: :pending)
    else
      # TODO: Create and handle custom error when creating completion and set the status respectively
      prompt_response = PromptsService.create_completion(name: @prompt.name, content: @prompt.content)
      @prompt.create_response(
        content: prompt_response,
        status: :completed
      )
    end

    redirect_to @prompt, notice: "Prompt creado con éxito."
  end

  # GET /prompts/:id
  def show
    @prompt = Prompt.find(params[:id])

    render :show
  end

  private

  def prompt_params
    params.require(:prompt).permit(:name, :content, :processed_in_job, :email)
  end

  def prompt_not_found
    redirect_to prompts_path, alert: "Prompt no encontrado."
  end
end
