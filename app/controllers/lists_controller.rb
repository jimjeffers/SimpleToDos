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
  end

  def update
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end


end
