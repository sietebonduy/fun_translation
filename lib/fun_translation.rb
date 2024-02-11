# frozen_string_literal: true

require 'faraday'
require 'json'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup

module FunTranslation
  def self.client(token = nil)
    FunTranslation::Client.new token
  end
end
