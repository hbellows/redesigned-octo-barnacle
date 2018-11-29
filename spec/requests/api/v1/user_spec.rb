require "rails_helper"

describe "GET /user" do
  it "returns a user with a valid API key" do
    user = create(:user, email: "uncle.jesse@example.com", name: "Jesse Katsopolis")
    api_key = create(:api_key)

    get "/api/v1/user?api_key=#{api_key.value}"

    expect(response.status).to eq 200

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data][:attributes]).to have_key :id
    expect(user[:data][:attributes]).to_not have_key :password_digest

    expect(user[:data][:attributes][:email]).to eq "uncle.jesse@example.com"
    expect(user[:data][:attributes][:name]).to  eq "Jesse Katsopolis"
  end

  it "prevents access without a valid API key" do
    api_key = create(:api_key)

    get "/api/v1/user?api_key=NOT_LEGIT"

    expect(response.status).to eq 401
  end

  it "prevents access without an API key" do
    get "/api/v1/user"

    expect(response.status).to eq 401
  end
end
