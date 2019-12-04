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
      @notes = @category.notes.recent
    else
      @notes = @category.notes.all
    end
  end

  

  # GET /notes/1
  def show; end 

  # GET /notes/new
  def new
    current_user
    @note = @category.notes.build
  
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  def create
    # @user = current_user
    @note = @category.notes.build(note_params)
    @note.set_user!(current_user)
    
    if @note.save
      redirect_to category_notes_path(@category), notice: 'Note was successfully created.'
    else  
      render :new
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      redirect_to category_note_path(@category), notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /notes/1
  def destroy
    if @note.destroy
      redirect_to category_notes_path(@category), notice: 'Note was successfully destroyed.'
    else
      redirect_to category_notes_path(@category), notice: 'Note failed to delete.'
    end
    
  end

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
    @notes = @category.notes.all
  end



  private

  # Use callbacks to share common setup or constraints between actions.
  def get_category
    @category = Category.find(params[:category_id])
  end

  def set_note
    @note = @category.notes.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def note_params
    params.require(:note).permit(:title, :content,:category_id)
  end
end
