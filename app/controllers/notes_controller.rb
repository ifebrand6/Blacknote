# frozen_string_literal: true

class NotesController < ApplicationController
  layout 'react'
  #before_action :get_category, except: %i[test trash state search tags]
  before_action :set_note, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # before_action :catergory_fill

  # GET /notes
  # try another

  def index
    @tags = Tag.all
    if
    params[:recent].present?
      @notes = @category.notes.recent.paginate(page: params[:page], per_page: 2)
    else
      @notes = Note.all_with_category_details.paginate(page: params[:page], per_page: 3)
      respond_to do |format|
        format.html
        format.csv { send_data @notes.as_csv }
      end
    end
  end

  # GET /notes/1
  def show
    respond_to do |format|
    format.html
    format.pdf do
        render pdf: "Note No. #{@note.id}",
        page_size: 'A4',
        template: "notes/show.html.erb",
        layout: "pdf.html",
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75
    end
  end
  end

  # GET /notes/new
  def new
    @note = @category.notes.build
    @location = request.location
  end

  # GET /notes/1/edit
  def edit
    @location = request.location
  end

  # POST /notes
  def create
    # @user = current_user
    @location = request.location
    @note = @category.notes.build(note_params)
    @note.set_user!(current_user)
    if @note.save
      redirect_to category_notes_path(@category), notice: 'Note was successfully created.'
    else
      flash[:errors] = @note.errors.full_messages
      render :new
    end
  end

  # PATCH/PUT /notes/1
  def update
    @location = request.location
    if @note.update(note_params)
      redirect_to category_note_path(@category,@note.slug), notice: 'Note was successfully updated.'
    else
      flash[:errors] = @note.errors.full_messages
      render :editßßß
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

  def test; end

  def search
    #@category = Category.where(id: 1)
    if params[:search].blank?
      # this should be redirected to the notes/index
      redirect_to(root_path, alert: 'Empty field!') && return
    else
      # @parameter = params[:search].downcase
      # @results = Note.all.where("lower(content) LIKE :search", search: "%#{@parameter}%")
      @results = Note.joins(:category).search(params[:search])
    end
  end

  def hashtags
    tag = Tag.find_by(keyword: params[:keyword])
    @notes = tag.notes
  end

  def tags
    @category = Category.unscoped.where(id: 1)
    @notes = Note.all
  end

  def trash
    @tags = Tag.all
    @notes = Note.only_deleted.paginate(page: params[:page], per_page: 3)
  end

  # data state- recover or destroy and object in the database
  def state
    @note = Note.unscoped.find(params[:id])
    if params[:type] == 'recover'
      if @note.restore
        redirect_to trash_path, notice: 'Note have been restored.'
      else
        redirect_ to trash_path, notice: 'Application could note remove this note.'
      end
    elsif params[:type] == 'forever'
      if @note.really_destroy!
        redirect_to trash_path, notice: 'Note have been destroyed.'
      else
        redirect_ to trash_path, notice: 'Application could note remove this note.'
      end
    elsif params[:type] == 'normal'
      if @note.destroy
        redirect_to category_notes_path(@category), notice: 'Note has been remove'
      else
        redirect_to category_note_path(@category), notice: 'Application fail to delete this note!'
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def get_category
  #   @category = Category.where(:category_id => 1)
  # end

  def set_note
    @note = @category.notes.friendly.find(params[:id])
  end

  def load_location
    @location = request.location
  end

  # Only allow a trusted parameter "white list" through.
  def note_params
    params.require(:note).permit(:title, :content, :category_id, :address,:slug)
  end
end
