# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :get_category
  before_action :set_note, only: %i[show edit update destroy ]
  before_action :authenticate_user!
  
  # before_action :catergory_fill
  

  # GET /notes
  # try another
  def index
    if 
    params[:recent].present?
      @notes = current_user.notes.recent
    else
      @notes = current_user.notes.all
    end
  end

  

  # GET /notes/1
  def show; end 

  # GET /notes/new
  def new
    @note = current_user.notes.new
    @category = Category.order('id ASC')
  end

  # GET /notes/1/edit
  def edit
    @category = Category.order('id DESC')
  end

  # POST /notes
  def create
    @note = current_user.notes.new(note_params)

    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
    else
      @category = Category.order('id DESC')
      render :new
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      @category = Category.order('id ASC')
      render :edit
    end
  end

  # DELETE /notes/1
  def destroy
    @note = current_user.notes.find(params[:id])
    if @note.destroy
      redirect_to notes_url, notice: 'Note was successfully destroyed.'
    else
      redirect_to notes-path, notice: 'Note failed to delete.'
    end
    
  end

  #GET /notes
  # def recent
  #   # if params[:recent] = true
  #   #   @notes = current_user.notes.recent  
  #   # else
  #     @notes = current_user.notes.recent
  #   # end
  # end
  def test
    
  end
  def search
    if params[:search].blank?
      #this should be redirected to the notes/index
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase  
      @results = Note.all.where("lower(content) LIKE :search", search: "%#{@parameter}%") 
    end
  end
  def hashtags
    tag = Tag.find_by(keyword: params[:keyword])
    @notes = tag.notes
  end
  def tags
    @notes = current_user.notes.all
  end



  private

  # Use callbacks to share common setup or constraints between actions.
  def get_category
    @category = Category.find(params[:id])
  end
  def set_note
    @note = current_user.notes.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def note_params
    params.require(:note).permit(:title, :content, :category_id,:note)
  end
end
