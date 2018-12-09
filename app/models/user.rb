class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  devise :database_authenticatable, :registerable, :trackable, :validatable
  
  field :email, type: String
  field :name, type: String
  # Adiciona campos password e password_confirmation 
  field :encrypted_password, type: String, default: ""

   ## Trackable
   field :sign_in_count,      type: Integer, default: 0
   field :current_sign_in_at, type: Time
   field :last_sign_in_at,    type: Time
   field :current_sign_in_ip, type: String
   field :last_sign_in_ip,    type: String
 

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  
end
