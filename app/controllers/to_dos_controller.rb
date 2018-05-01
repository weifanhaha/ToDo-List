class ToDosController < ApplicationController
  before_action :find_to_do, only: [:show, :edit, :update, :destroy]

  def index
    @to_dos = ToDo.all
  end

  def show
  end

  def new
    @to_do = ToDo.new
  end

  def create
    @to_do = ToDo.new to_do_params
    @to_do.save!
    flash[:success] = "Added Successfully：#{@to_do.title}"
    redirect_to root_path
  rescue StandardError => e
    flash[:error] = "Error：#{e}"
    redirect_back fallback_location: new_to_do_path
  end

  def edit
  end

  def update
    @to_do.update_attributes!(to_do_params)
    flash[:success] = "Updated Successfully：#{@to_do.title}"
    redirect_to @to_do
  rescue StandardError => e
    flash[:error] = "Error：#{e}"
    redirect_back fallback_location: edit_to_do_path
  end

  def destroy
    @to_do.destroy
    redirect_to root_path
  end

  private

  def find_to_do
    @to_do = ToDo.find(params[:id])
  end

  def to_do_params
    params.require(:to_do).permit!
  end

end
