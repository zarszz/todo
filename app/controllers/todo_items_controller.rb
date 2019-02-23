#create method for todo_items database management
class TodoItemsController < ApplicationController
    before_action :set_todo_list

    def create
        @todo_item = @todo_list.todo_items.create(todo_item_params)
        redirect_to @todo_list
    end

    def destroy
        @todo_item = @todo_list.todo_item.find(params[:id])
        if @todo_item.destroy
            flash[:succes] = "Todo list item was deleted."
        else
            flash[:error] = "Todo List item could not be deleted"
        end
        redirect_to @todo_list
    end

    private
        def set_todo_list
            @todo_list = TodoList.find(params[:todo_list_id])
        end

        def todo_item_params
            params[:todo_item].permit(:content)
        end
end
