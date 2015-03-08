class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age, :location, :created_at, :avatar 
end
