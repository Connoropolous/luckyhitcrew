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

  # GET /pagetexts/1/edit
  def edit
    @pagetext = Pagetext.find(params[:id])
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

end
