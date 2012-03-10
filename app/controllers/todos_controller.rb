class TodosController < ApplicationController
  before_filter :get_list
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(params[:todo])
    if @list.todos << @todo
      redirect_to list_path(@list), :notice => "Your todo was successfully created."
    else
      flash[:error] = "Your todo could not be saved."
      render :action => "new"
    end
  end
  
  def show
    @todo = @list.todos.find(params[:id])
  end
  
  protected
  def get_list
    @list = List.find(params[:list_id])
  end
end
