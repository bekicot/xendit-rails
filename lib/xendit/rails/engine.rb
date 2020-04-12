# frozen_string_literal: true

module Xendit
  autoload :TimestampMapable, "xendit/concerns/orderable"
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Xendit
      config.generators.api_only = true
    end
  end
end
