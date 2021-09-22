class TopsController < ApplicationController
  def index
  end

  def create
  end

  def edit
  end

  def update
    current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :noodle_id, :soup_id, :meat_id, :vegetable_id, :garlic_id, :oil_id)
  end
end
