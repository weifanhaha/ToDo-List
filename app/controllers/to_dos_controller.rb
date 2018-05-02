class ToDosController < ApplicationController
  before_action :find_to_do, only: [:show, :destroy, :check]
  before_action :set_todo_list, only: [:create, :destroy, :check]

  # def index
  #   @to_dos = ToDo.all
  # end

  # def show
  # end

  # def new
  #   @to_do = ToDo.new
  # end

  def create
    @to_do = ToDo.new to_do_params
    @to_do.todo_list = @todo_list
    @to_do.save!
    flash[:success] = "Added Successfully：#{@to_do.title}"
    redirect_to @todo_list
  rescue StandardError => e
    flash[:error] = "Error：#{e}"
    redirect_back fallback_location: new_todo_list_to_do_path
  end

  # def edit
  # end

  # def update
  #   @to_do.update_attributes!(to_do_params)
  #   flash[:success] = "Updated Successfully：#{@to_do.title}"
  #   redirect_to @to_do
  # rescue StandardError => e
  #   flash[:error] = "Error：#{e}"
  #   redirect_back fallback_location: edit_todo_list_to_do_path
  # end

  def check
    if @to_do.isdone?
      @to_do.status = 0
    else
      @to_do.status = 1
    end
    @to_do.save!
    redirect_to @todo_list
  rescue StandardError => e
    flash[:error] = "Error：#{e}"
    redirect_to @todo_list
  end

  def destroy
    @to_do.destroy
    redirect_to @todo_list
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def find_to_do
    @to_do = ToDo.find(params[:id])
  end

  def to_do_params
    params.require(:to_do).permit!
  end

end
