class UserMailer < ApplicationMailer
  default :from => 'sp19-bse-041@cuilahore.edu.pk'

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to RoboVerse')
      end

      def forget_email(user)
        @user = user
        mail(to: @user.email, subject: 'Reset Password for RoboVerse')
      end

end
