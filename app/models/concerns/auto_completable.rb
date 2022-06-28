# frozen_string_literal: true

module AutoCompletable
  extend ActiveSupport::Concern

  included do
    after_validation :autocomplete, on: :create
  end

  def autocomplete
    self.complete = false
  end
end
