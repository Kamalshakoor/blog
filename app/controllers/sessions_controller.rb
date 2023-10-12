class SessionsController < ApplicationController

    def new
        
    end

    def create 
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged In Successfully!"
            redirect_to User
        else
            flash[:alert] = "Username or password is incorrect!"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out Successfully!"
        redirect_to root_path
    end


end