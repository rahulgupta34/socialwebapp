class RegistrationsController < Devise::RegistrationsController

    def new
        super
    end
    
    def create
        @user = User.new(signup_params)
        if @user.save
            UserMailer.welcome_user(@user).deliver_later
            sign_in(@user)
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def signup_params
        params.require(:user).permit(:email, :password, :password_confirmation, :image, addresses_attributes: [:id, :address, :pincode, :state, :country, :landmark, :_destroy])
    end
end
