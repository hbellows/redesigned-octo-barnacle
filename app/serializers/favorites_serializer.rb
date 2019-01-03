class FavoritesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :neo_reference_id, :user_id, :asteroid

end

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