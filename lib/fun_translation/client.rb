module FunTranslation
  class Client
    include FunTranslation::Request

    attr_accessor :token
    
    def initialize(token = nil)
      @token = token
    end

    def translate(endpoint, text, params = {})
      FunTranslation::Translation.new(
        post("/translate/#{endpoint}.json",
        self,
        { text: text  }.merge(params))
      )
    end
  end
end