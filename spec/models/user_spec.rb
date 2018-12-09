require 'rails_helper'

RSpec.describe User, type: :model do
  # Cria usuário antes de cada passo
  before(:each) do
    @user1 = create(:user)
  end
  
  it "usuário com atributos válidos" do
    expect(@user1).to be_valid
  end
  
  
  it "tem email único" do
    user2 = build(:user,email: @user1.email, name: Faker::Name.name)
    expect(user2).to_not be_valid
  end
  
  it "não é válido sem senha" do 
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end
  
  it "não é válido sem nome" do 
    user2 = build(:user, name: nil)
    expect(user2).to_not be_valid
  end
  
  it "não é válido sem email" do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end
end
