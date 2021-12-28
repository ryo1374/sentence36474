class TextsController < ApplicationController
  before_action :set_text, only: [:show, :edit, :update, :destroy]

  def index
    @texts = params[:tag_id].present? ? Tag.find(params[:tag_id]).texts : Text.all
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)
    if @text.valid?
      @text.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @text.destroy
    redirect_to root_path
  end

  def edit
    #text_attributes = @text.attributes
    #@text_form = TextForm.new(text_attributes)
    #@text_form.tag_name = @text.tags&.first&.tag_name
  end

  def update
    #@text = Text.new(text_params)
    if @text.valid?
      @text.update(text_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
   
  end

  def search
    @texts = Text.search(params[:keyword])
  end


  private
  def text_params
    params.require(:text).permit(:sentence, :translate, :remarks, :type_id, tag_ids: []).merge(user_id: current_user.id)
  end

  def set_text
    @text = Text.find(params[:id])
  end
end
