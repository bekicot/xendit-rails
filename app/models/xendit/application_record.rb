# frozen_string_literal: true

module Xendit
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    include Xendit::TimestampMapable

    ATTRIBUTES = %i[created updated].freeze

    def self.allowed_attributes
      ATTRIBUTES + self::ATTRIBUTES
    end
  end
end
