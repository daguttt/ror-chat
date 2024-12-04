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
    @prompt = Prompt.new(prompt_params)

    if @prompt.save
      redirect_to @prompt, notice: "Prompt creado con éxito."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /prompts/:id
  def show
    @prompt = Prompt.find(params[:id])

    render :show
  end

  private

  def prompt_params
    params.require(:prompt).permit(:name, :content, :processed_in_job)
  end

  def prompt_not_found
    redirect_to prompts_path, alert: "Prompt no encontrado."
  end
end
