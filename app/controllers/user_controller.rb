class UserController < ApplicationController
  def control_panel
    @user = current_user
  end

  def set_status
    user_params = params.require(:user).permit(:status, :status_message, :name)
    current_user.update_attributes(user_params)

    redirect_to control_panel_path 
  end
end
