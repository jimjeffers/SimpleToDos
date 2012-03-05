class TodosController < ApplicationController
  before_filter :get_list
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(params[:todo])
    if @list.todos << @todo
      redirect_to list_todo_path(@list,@todo)
    else
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
