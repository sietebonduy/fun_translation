# frozen_string_literal: true

module FunTranslation
  module Connection
    BASE_URL = 'https://api.funtranslations.com'

    def connection(client)
      Faraday.new(options(client)) do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.request :url_encoded
      end
    end

    private

    def options(client)
      headers = {
        accept: 'application/json',
        'Content-Type' => 'application/x-www-form-urlencoded',
        user_agent: "fun_translation gem/#{FunTranslation::VERSION}"
      }

      headers['X-Funtranslations-Api-Secret'] = client.token unless client.token.nil?

      {
        headers: headers,
        url: BASE_URL
      }
    end
  end
end
