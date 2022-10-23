# frozen_string_literal: true

require_relative "DreamTeam/version"

module DreamTeam
  class Error < StandardError; end
  require "DreamTeam/Games/html_table"
  require "DreamTeam/Films/html_table"
end
