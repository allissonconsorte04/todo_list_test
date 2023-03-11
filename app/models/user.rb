class User < ApplicationRecord
  validates :full_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
  validates :gender, presence: true, inclusion: { in: ['Feminino', 'Masculino', 'Outro'] }
  validates :profile_type, presence: true, inclusion: { in: ['Guest', 'Back', 'Front'] }
end
