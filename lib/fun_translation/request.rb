# frozen_string_literal: true

module FunTranslation
  module Request
    include FunTranslation::Connection

    def post(path, client, params = {})
      respond_with(
        connection(client).post(path, params)
      )
    end

    def respond_with(raw_response)
      body = if raw_response.body.empty?
               raw_response.body
             else
               JSON.parse(raw_response.body)
             end

      respond_with_error(raw_response.status, body['error']) unless raw_response.success?

      body['contents']
    end

    def respond_with_error(code, body)
      raise(FunTranslation::Error.from_response(body)) unless FunTranslation::Error::ERRORS.key?(code)

      raise FunTranslation::Error::ERRORS[code].from_response(body)
    end
  end
end
