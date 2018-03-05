class TodosController < ApplicationController
  def index
    @todos = Todo.all

    if params[:id]
      @todo = Todo.find(params[:id])
    else
      @todo = Todo.new
    end
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save

    # 使用 AJAX 後不會有重新載入的行為，因此可以移除。
#    redirect_to todos_path
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update_attributes(todo_params)

    # 使用 AJAX 後不會有重新載入的行為，因此可以移除。
#    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    # 使用 AJAX 後不會有重新載入的行為，因此可以移除。
#    redirect_to todos_path
  end

  def toggle_check
    # 使用 Rails ActiveRecord 的 toggle 方法
    # toggle 方法會把帶入的資料屬性進行 true／false 的切換
    
    @todo = Todo.find(params[:id])
    # 當值是 boolean 的時候，可以使用 toggle 方法來切換 true/false
    # 加上驚歎號表示會直接存入資料庫（否則要另外 save)
    # ref: http://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-toggle
    @todo.toggle!(:done)

    # 使用 AJAX 後不會有重新載入的行為，因此可以移除。
#    redirect_to todos_path    
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
