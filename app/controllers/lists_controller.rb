class ListsController < ApplicationController
  def new
    # Hint: We need to provide an instance of a list to the view.
    @list = List.new
  end
  
  # Hint:
  # You can specify flash :notice or :error on redirect_to.
  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to @list, :notice =>"List successfully created."
    else
      flash[:error] = "Your list could not be saved."
      render :action => "new"
    end
  end
  
  def show
    @list = List.find(params[:id])
    # Hint: You might need a todo to reference in your todo form.
    @todo = Todo.new
  end
  
  def index
    @lists = List.all
  end
  
  # Missing actions:
  # --------------------
  # edit
  # update

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      redirect_to lists_path, :notice => "Your list was successfully updated."
    else
      flash[:error] = "Your new list could not be saved."
      render :action => "edit"
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end


end
