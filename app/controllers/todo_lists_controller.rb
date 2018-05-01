class TodoListsController < ApplicationController
  before_action :find_todo_list, only: [:show, :edit, :update, :destroy]

  def index
    @todo_lists = TodoList.all
  end

  def show
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    @todo_list = TodoList.new todo_list_params
    @todo_list.save!
    flash[:success] = "Added Successfully：#{@todo_list.title}"
    redirect_to @todo_list
  rescue StandardError => e
    flash[:error] = "Error：#{e}"
    redirect_back fallback_location: new_todo_list_path
  end

  def edit
  end

  def update
    @todo_list.update_attributes!(todo_list_params)
    flash[:success] = "Updated Successfully：#{@todo_list.title}"
    redirect_to @todo_list
  rescue StandardError => e
    flash[:error] = "Error：#{e}"
    redirect_back fallback_location: edit_todo_list_path
  end

  def destroy
    @todo_list.destroy
    redirect_to root_path
  end

  private

  def find_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit!
  end
end
