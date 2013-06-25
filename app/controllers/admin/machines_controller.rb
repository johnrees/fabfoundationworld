class Admin::MachinesController < Admin::AdminController
  before_action :set_machine, only: [:show, :edit, :update, :destroy]

  def new
    @machine = Machine.new
  end

  def index
    @machines = Machine.all
  end

  def create
    @machine = Machine.new(machine_params)
    if @machine.save
      redirect_to admin_machines_path, notice: 'Machine was successfully created.'
    else
      render action: 'new'
    end
  end

private

  def set_machine
    @machine = Machine.find(params[:id])
  end

  def machine_params
    params.require(:machine).permit(:name)
  end

end
