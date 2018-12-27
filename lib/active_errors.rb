# frozen_string_literal: true

%w[version messages].each do |file_name|
  require "active_errors/#{file_name}"
end
