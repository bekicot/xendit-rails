# frozen_string_literal: true

module Xendit
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Xendit::Rails
      config.generators.api_only = true
    end
  end
end
