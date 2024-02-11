# frozen_string_literal: true

module TestClient
  def test_client(token = nil)
    FunTranslation.client token
  end
end
