# frozen_string_literal: true

module Xendit::TimestampMapable
  extend ActiveSupport::Concern
  included do
    alias_attribute :created, :created_at
    alias_attribute :updated, :updated_at
  end
end
