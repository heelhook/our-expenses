require 'rails_helper'

RSpec.describe "Dues", type: :request do
  describe "GET /dues" do
    it "works! (now write some real specs)" do
      get dues_path
      expect(response).to have_http_status(200)
    end
  end
end
