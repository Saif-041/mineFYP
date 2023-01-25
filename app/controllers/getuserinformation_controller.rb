class GetuserinformationController < ApplicationController
    def show
        @user = User.find_by_id(params[:id])
        if @user.nil?  
          render json: {
              message: "Invalid UserId",
               status: 404
            }, status: :ok
        else
        render json: {
            user: @user,
            status: 200
          }, status: :ok
        end
    end

    def changeAvatar
        @user = User.find_by_id(params[:id])
        @avatar = params[:avatar]
        if @user.nil?  
          render json: {
              message: "Invalid UserId",
               status: 404
            }, status: :ok
        elsif @avatar.nil?
            render json: {
              message: "Invalid AvatarID",
               status: 404
            }, status: :ok
        else
            @user.avatar = @avatar
            @user.save
            render json: {
              message: "Avatar Changed",
              avatar: @user.avatar,
               status: 200
            }, status: :ok
        end
    end

    def rename
        @user = User.find_by_id(params[:id])
        if @user.nil?  
            render json: {
                message: "Invalid UserId",
                 status: 404
              }, status: :ok
        else
            prev_name = @user.name
            @user.name = params[:name]
            @user.save
            render json: {
              message: "User Name Changed from '" + prev_name + "' to '" + @user.name + "'.",
               status: 200
            }, status: :ok
        end
    end
end
