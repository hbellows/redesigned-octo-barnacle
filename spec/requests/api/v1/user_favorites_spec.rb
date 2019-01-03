require 'rails_helper'

describe 'GET / user/favorites' do
  it 'returns user favorite asteroids' do

    uncle_jesse = User.create(name: "Jesse Katsopolis", email: "uncle.jesse@example.com")
    uncle_jesse.create_api_key(value: "abc123")
    uncle_jesse.favorites.create(neo_reference_id: "2153306")

    get '/api/v1/user/favorites?api_key=abc123'
    expect(response.status).to eq(200)

    returned_json = JSON.parse(response.body, symbolize_names: true)
# binding.pry
    expect(returned_json[:data][0][:attributes][:neo_reference_id]).to eq("2153306")
    expect(returned_json[:data][0][:attributes][:asteroid][:name]).to eq("153306 (2001 JL1)")
    expect(returned_json[:data][0][:attributes][:asteroid][:is_potentially_hazardous_asteroid]).to eq(false)
  end
end

# As a registered user
# When I send a 'GET' request to '/api/v1/user/favorites?api_key=abc123'

# [
#   {
#     "id":1,
#     "neo_reference_id": "2153306",
#     "user_id": 1,
#     "asteroid": {
#       "name": "153306 (2001 JL1)",
#       "is_potentially_hazardous_asteroid": false,
#     }
#   }
# ]

describe 'POST / user/favorites' do
  it 'returns user favorite asteroids' do

    uncle_jesse = User.create(name: "Jesse Katsopolis", email: "uncle.jesse@example.com")
    uncle_jesse.create_api_key(value: "abc123")

    post '/api/v1/user/favorites?api_key=abc123&neo_reference_id=2021277'
    expect(response.status).to eq(200)

    get '/api/v1/user/favorites?api_key=abc123'
    returned_json = JSON.parse(response.body, symbolize_names: true)
# binding.pry
    expect(returned_json[:data][0][:attributes][:neo_reference_id]).to eq("2021277")
    expect(returned_json[:data][0][:attributes][:asteroid][:name]).to eq("21277 (1996 TO5)")
    expect(returned_json[:data][0][:attributes][:asteroid][:is_potentially_hazardous_asteroid]).to eq(false)
  end
end
# When I send a POST request to "/api/v1/user/favorites" with an 'api_key' of 'abc123' and a 'neo_reference_id' of '2021277'
# Then I should receive a response with a status code of 200
# And the body should be JSON as follows:
# ```

# ```
# {
#   "id":2,
#   "neo_reference_id": "2021277",
#   "user_id": 1,
#   "asteroid": {
#     "name": "21277 (1996 TO5)",
#     "is_potentially_hazardous_asteroid": false,
#   }
# }
# ```