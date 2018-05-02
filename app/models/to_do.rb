class ToDo < ApplicationRecord
  belongs_to :todo_list

  def isdone?
    if self.status == 1
      return true
    else
      return false
    end
  end
end
