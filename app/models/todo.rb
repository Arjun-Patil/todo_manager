class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true
  belongs_to :user

  def self.of_user(user)
    all.where(user_id: user.id)
  end

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
