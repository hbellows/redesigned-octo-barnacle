class AsteroidSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :is_potentially_hazardous_asteroid
end
