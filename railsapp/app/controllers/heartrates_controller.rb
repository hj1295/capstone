class HeartratesController < ApplicationController
  before_action :set_heartrate, only: [:show, :edit, :update, :destroy]

  # GET /heartrates
  # GET /heartrates.json
  def index
    @heartrates = Heartrate.all
  end

  # GET /heartrates/1
  # GET /heartrates/1.json
  def show
  end

  # GET /heartrates/new
  def new
    @heartrate = Heartrate.new
  end

  # GET /heartrates/1/edit
  def edit
  end

  # POST /heartrates
  # POST /heartrates.json
  def create
    @heartrate = Heartrate.new(heartrate_params)

    respond_to do |format|
      if @heartrate.save
        format.html { redirect_to @heartrate, notice: 'Heartrate was successfully created.' }
        format.json { render :show, status: :created, location: @heartrate }
      else
        format.html { render :new }
        format.json { render json: @heartrate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heartrates/1
  # PATCH/PUT /heartrates/1.json
  def update
    respond_to do |format|
      if @heartrate.update(heartrate_params)
        format.html { redirect_to @heartrate, notice: 'Heartrate was successfully updated.' }
        format.json { render :show, status: :ok, location: @heartrate }
      else
        format.html { render :edit }
        format.json { render json: @heartrate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heartrates/1
  # DELETE /heartrates/1.json
  def destroy
    @heartrate.destroy
    respond_to do |format|
      format.html { redirect_to heartrates_url, notice: 'Heartrate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heartrate
      @heartrate = Heartrate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def heartrate_params
      params.require(:heartrate).permit(:device, :value, :time)
    end
end
