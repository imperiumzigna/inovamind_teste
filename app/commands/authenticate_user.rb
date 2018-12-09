class AuthenticateUser
    prepend SimpleCommand
  
    def initialize(params = {})
      @email = params.fetch(:email)
      @password = params.fetch(:password)
    end
  
    def call
      JsonWebToken.encode(user_id: user.id) if user
    end
  
    private
  
    attr_accessor :email, :password
  
    def user
      user = User.find_by(email: email)
      return user if user && user.valid_password?(password)
  
      errors.add :user_authentication, 'Credenciais Inválidas'
      nil
    end
end