class MangasController < ApplicationController

  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_filter :get_manga, :only => [:update, :edit, :destroy]

  def index
  	@mangas = Manga.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mangas }
    end
  end

  def new
  	@manga = Manga.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manga }
    end
  end

  # POST /mangas
  # POST /mangas.json
  def create
    @manga = Manga.new(params[:manga])

    respond_to do |format|
      if @manga.save
        format.html { redirect_to @manga, notice: 'Manga was successfully created.' }
        format.json { render json: @manga, status: :created, location: @manga }
      else
        format.html { render action: "new" }
        format.json { render json: @manga.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    if params[:id_or_slug] =~ /^\d+$/
      @manga = Manga.includes(:chapters).find(params[:id_or_slug])
    else
      @manga = Manga.includes(:chapters).find_by_slug(params[:id_or_slug])
    end
  end

  def update
    @manga.update_attributes!(params[:manga])
    redirect_to edit_manga_path(@manga)
  end


  def edit
  end

  def destroy
    @manga.delete
    redirect_to root_path
  end

  private

  def get_manga
    @manga = Manga.find_by_slug(params[:id_or_slug])
  end

end