module ToDosHelper
  def todo_block_done(done)
    if done
      return 'todo-block todo-block-done'
    else
      return 'todo-block'
    end
  end
end
