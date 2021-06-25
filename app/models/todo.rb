class Todo < ActiveRecord::Base
  belongs_to :user

  def self.overdue
    order(:due_date).where("due_date < ?", Date.today)
  end

  def self.due_today
    order(:due_date).where("due_date = ?", Date.today)
  end

  def self.due_later
    order(:due_date).where("due_date > ?", Date.today)
  end

  def self.completed
    order(:due_date).where(completed: true)
  end

  def self.uncompleted
    order(:due_date).where(completed: false)
  end
end
