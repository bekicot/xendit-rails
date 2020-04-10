# frozen_string_literal: true

module Xendit
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
