require "securerandom"

class Task
  attr_reader :id, :name, :priority
  def initialize(id, name, priority)
    @id = id
    @name = name
    @priority = priority
  end
end

class TaskManager
  def initialize
    @task_list = []
  end

  def add_task(name, priority = 0)
    @task_list.push(Task.new(SecureRandom.uuid, name, priority))
  end

  def fetch_task
    @task_list.pop
  end

  def fetch_priority_first
    sorted_list = @task_list.sort do |a, b|
      a.priority <=> b.priority
    end

    last_task = sorted_list.last

    @task_list.delete_if { |item| item.id == last_task.id }

    return last_task
  end
end
