# frozen_string_literal: true

class TaskList < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
