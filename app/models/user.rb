class User < ApplicationRecord
  self.inheritance_column = :_type_disabled
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :name_validation

  has_many :emprestimos

  def index
  end

  def name_validation
    if name.nil? || name == ""
      errors.add(:name, "Por favor, adicione seu nome completo")
    end
  end
end
