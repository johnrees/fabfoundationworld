class Admin::ToolsController < Admin::AdminController

  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  def new
    @tool = Tool.new
  end

  def index
    @tools = Tool.all
  end

  def edit
  end

  def update
    if @tool.update(tool_params)
      redirect_to admin_tools_path, notice: 'Tool was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to admin_tools_path, notice: 'Tool was successfully created.'
    else
      render action: 'new'
    end
  end

private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name)
  end

end
