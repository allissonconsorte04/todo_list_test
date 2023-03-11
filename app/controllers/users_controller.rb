class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if CpfUtils.valid_cpf?(user_params[:cpf])
      if @user.valid?
        @user.save
        render json: { status: 'SUCCESS', message: 'Usuário criado com sucesso' }
      else
        render json: { status: 'ERROR', message: 'Não foi possível criar o usuário', errors: @user.errors }, status: :unprocessable_entity
      end
    else
      render json: { status: 'ERROR', message: 'Não foi possível criar o usuário', errors: {'cpf': ['CPF inválido']}}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:full_name, :email, :phone, :cpf, :gender, :profile_type)
  end
end
