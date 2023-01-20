class UserMailer < ApplicationMailer
  default :from => 'saif786999999@gmail.com'

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to RoboVerse')
      end

      def forget_email(user)
        @user = user
        mail(to: @user.email, subject: 'Reset Password for RoboVerse')
      end

end
