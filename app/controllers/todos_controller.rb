class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!
  
  # GET /todos
  # GET /todos.json
  def index
    ##@user = User.find_by_username(params[:user_id])
    
    @todos = Todo.where(user_id: current_user.id)
    
    order = params[:order] || 'created'
    
    @todos = case order
      when 'created' then @todos.sort_by{ |t| t.created }
      when 'priority' then @todos.sort_by{ |t|  t.priority }
      when 'duedate'  then @todos.sort_by{ |t| t.duedate }
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end
  
  def new_task
    @todo = Todo.new
    #-------------------------------------------------
    #@todo.created = DateTime.now.to_datetime
    #@todo.completed = ""
    #@todo.closed = ""
    #-------------------------------------------------
    puts "Olemme new_task sisällä"
    # Modal
    respond_to do |format|
      format.html
      format.js
    end
    #
  end

  # GET /todos/1/edit
  def edit
  end
  
  def edit_task
     @todo = Todo.find(params[:id])
     # Modal
    respond_to do |format|
      format.html
      format.js
    end 
  end

  # POST /todos
  # POST /todos.json
  def create
    puts "Olemme create"
    puts current_user.id
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id
    @todo.created = DateTime.now.to_datetime
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
        format.json { render :index, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_param)
        format.html { redirect_to todos_path, notice: 'Todo was successfully updated.' }
        format.json { render :index, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def close
    todo = Todo.find(params[:id])
    todo.update_attribute :closed, (not todo.closed)
    new_status = todo.closed ? "Aktiivinen" : "Valmis"
    redirect_to todos_path, notice:"Tehtävä status vaihdettu tilaan #{new_status}" 
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todos).permit(:description, :created, :completed, :priority, :duedate, :closed, :user_id)
    end
  
  
    def todo_param
      params.require(:todo).permit(:description, :created, :completed, :priority, :duedate, :closed, :user_id)
    end
  
    def modal_params
      params.permit(:active)
    end
    
end
