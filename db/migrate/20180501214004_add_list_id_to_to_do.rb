class AddListIdToToDo < ActiveRecord::Migration[5.1]
  def change
    add_column :to_dos, :todo_list_id, :integer
  end
end
