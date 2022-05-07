class RegistrationsController < Devise::RegistrationsController
    
    private

    def sign_up_params
        params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password)
    end

    def after_sign_up_path_for(resource)
        root_path # or any other path
    end

end