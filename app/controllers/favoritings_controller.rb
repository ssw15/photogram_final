class FavoritingsController < ApplicationController
  before_action :set_favoriting, only: [:show, :edit, :update, :destroy]

  # GET /favoritings
  # GET /favoritings.json
  def index
    @favoritings = Favoriting.all
  end

  # GET /favoritings/1
  # GET /favoritings/1.json
  def show
  end

  # GET /favoritings/new
  def new
    @favoriting = Favoriting.new
  end

  # GET /favoritings/1/edit
  def edit
  end

  # POST /favoritings
  # POST /favoritings.json
  def create
    @favoriting = Favoriting.new(favoriting_params)

    respond_to do |format|
      if @favoriting.save
        format.html { redirect_to @favoriting, notice: 'Favoriting was successfully created.' }
        format.json { render :show, status: :created, location: @favoriting }
      else
        format.html { render :new }
        format.json { render json: @favoriting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favoritings/1
  # PATCH/PUT /favoritings/1.json
  def update
    respond_to do |format|
      if @favoriting.update(favoriting_params)
        format.html { redirect_to @favoriting, notice: 'Favoriting was successfully updated.' }
        format.json { render :show, status: :ok, location: @favoriting }
      else
        format.html { render :edit }
        format.json { render json: @favoriting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favoritings/1
  # DELETE /favoritings/1.json
  def destroy
    @favoriting.destroy
    respond_to do |format|
      format.html { redirect_to favoritings_url, notice: 'Favoriting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favoriting
      @favoriting = Favoriting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favoriting_params
      params.require(:favoriting).permit(:photo_id, :favorited_by_id)
    end
end
