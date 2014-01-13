class PagetextsController < ApplicationController
  
  before_filter :authenticate_admin!
  
  # GET /pagetexts
  # GET /pagetexts.json
  def index
    @pagetexts = Pagetext.order("id")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pagetexts }
    end
  end

  # GET /pagetexts/new
  # GET /pagetexts/new.json
  def new
    @pagetext = Pagetext.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pagetext }
    end
  end

  # GET /pagetexts/1/edit
  def edit
    @pagetext = Pagetext.find(params[:id])
  end

  # POST /pagetexts
  # POST /pagetexts.json
  def create
    @pagetext = Pagetext.new(params[:pagetext])

    respond_to do |format|
      if @pagetext.save
        format.html { redirect_to pagetexts_url, notice: 'Pagetext was successfully created.' }
        format.json { render json: @pagetext, status: :created, location: @pagetext }
      else
        format.html { render action: "new" }
        format.json { render json: @pagetext.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pagetexts/1
  # PUT /pagetexts/1.json
  def update
    @pagetext = Pagetext.find(params[:id])

    respond_to do |format|
      if @pagetext.update_attributes(params[:pagetext])
        format.html { redirect_to pagetexts_url, notice: 'Pagetext was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pagetext.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagetexts/1
  # DELETE /pagetexts/1.json
  def destroy
    @pagetext = Pagetext.find(params[:id])
    @pagetext.destroy

    respond_to do |format|
      format.html { redirect_to pagetexts_url }
      format.json { head :no_content }
    end
  end
end
