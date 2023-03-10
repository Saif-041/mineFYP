class PasswordController < ApplicationController
    def forgot
        if params[:email].blank?
            render json: {error: "Email not present",status:404}, status: :ok
        end
        @user = User.find_by(email: params[:email])
        if @user.present?
            @user.generate_password_token!
                UserMailer.forget_email(@user).deliver_now
                render json: {message:"reset token sent to email",status: 200}, status: :ok
        else
            render json: {error: "Email address not found. Please check and try again",status:404}, status: :ok
        end
    end

    def reset
      token = params[:token].to_s
  
      if params[:token].blank?
          render json: {error: "Token not present",status:404}, status: :ok
      end
  
      @user = User.find_by(reset_password_token: token)
  
      if @user.present? && @user.password_token_valid?
        if @user.reset_password!(params[:password])
          render json: {message:"password changed successfully!!!",status: 200}, status: :ok
        end
      else
        render json: {error:"Token not valid or expired. Try generating a new Token.",status:401}, status: :ok
      end
    end
end