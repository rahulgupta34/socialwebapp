class UserMailer < ApplicationMailer

    def welcome_user(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to Rahul Gupta World!')
    end
end
