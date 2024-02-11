# frozen_string_literal: true

module FunTranslation
  class Error < StandardError
    ClientError = Class.new(self)
    ServerError = Class.new(self)

    BadRequest = Class.new(ClientError)
    Unauthorized = Class.new(ClientError)
    NotAcceptable = Class.new(ClientError)
    NotFound = Class.new(ClientError)
    Conflict = Class.new(ClientError)
    TooManyRequests = Class.new(ClientError)
    Locked = Class.new(ClientError)
    MethodNotAllowed = Class.new(ClientError)

    NotImplemented = Class.new(ServerError)
    BadGateway = Class.new(ServerError)
    ServiceUnavailable = Class.new(ServerError)
    GatewayTimeout = Class.new(ServerError)

    ERRORS = {
      400 => FunTranslation::Error::BadRequest,
      401 => FunTranslation::Error::Unauthorized,
      404 => FunTranslation::Error::NotFound,
      405 => FunTranslation::Error::MethodNotAllowed,
      406 => FunTranslation::Error::NotAcceptable,
      409 => FunTranslation::Error::Conflict,
      423 => FunTranslation::Error::Locked,
      429 => FunTranslation::Error::TooManyRequests,
      500 => FunTranslation::Error::ServerError,
      501 => FunTranslation::Error::NotImplemented,
      502 => FunTranslation::Error::BadGateway,
      503 => FunTranslation::Error::ServiceUnavailable,
      504 => FunTranslation::Error::GatewayTimeout
    }.freeze

    def self.from_response(body)
      msg = body['detail'] || body['message']
      new msg.to_s
    end
  end
end
