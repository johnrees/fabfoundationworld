class LabsController < ApplicationController

  def created
  end

  # GET /labs
  # GET /labs.json
  def index
    @labs = Lab.all
  end

  # GET /labs/1
  # GET /labs/1.json
  def show
    @lab = Lab.friendly.find(params[:id])
    authorize! :show, @lab
  end

  # GET /labs/new
  def new
    @lab = Lab.new
    @days = %w(mon tue wed thu fri sat sun)
    7.times do
      @lab.opening_times.build
    end
  end

  def map
    @labs = Lab.all
  end

  # POST /labs
  # POST /labs.json
  def create
    @lab = Lab.new(lab_params)

    respond_to do |format|
      if @lab.save
        format.html { render :created }
        format.json { render action: 'show', status: :created, location: @lab }
      else
        format.html { render action: 'new' }
        format.json { render json: @lab.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_params
      params.require(:lab).permit(
        :name,
        :address,
        :postal_code,
        :kind,
        :notes,
        :latitude,
        :longitude,
        :country_code
      )
    end
end
