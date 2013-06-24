class Admin::LabsController < Admin::AdminController
  before_action :set_lab, only: [:show, :edit, :update, :destroy]

  # GET /labs
  # GET /labs.json
  def index
    @labs = Lab.all
  end

  # GET /labs/1
  # GET /labs/1.json
  def show
  end

  # GET /labs/new
  def new
    @lab = Lab.new
  end

  # GET /labs/1/edit
  def edit
    # 7.times do |day|
    #   @lab.opening_times.each do |time|
    #     break if time.start_minute => day and time.start_minute <=
    #   end
    #   @lab.opening_times.build
    # end

    # 7.times do |day|
    #   @lab.opening_times.build(
    #     start_minute: (day * Time.minutes_in_a_day) + (18 * 30),
    #     end_minute: (day * Time.minutes_in_a_day) + (34 * 30)
    #   )
    # end
  end

  # POST /labs
  # POST /labs.json
  def create
    @lab = Lab.new(lab_params)

    respond_to do |format|
      if @lab.save
        format.html { redirect_to @lab, notice: 'Lab was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lab }
      else
        format.html { render action: 'new' }
        format.json { render json: @lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labs/1
  # PATCH/PUT /labs/1.json
  def update
    respond_to do |format|
      if @lab.update(lab_params)
        format.html { redirect_to @lab, notice: 'Lab was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labs/1
  # DELETE /labs/1.json
  def destroy
    @lab.destroy
    respond_to do |format|
      format.html { redirect_to labs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab
      @lab = Lab.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_params
      params.require(:lab).permit(:name, :address, :postal_code, :state, :opening_times_attributes => [:id, :start_minute, :end_minute, '_destroy'])
    end
end

