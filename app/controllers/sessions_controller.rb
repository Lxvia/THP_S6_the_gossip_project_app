class SessionsController < ApplicationController

    def create 
        user = User.find_by(email: params[:email])
        #chercher si il existe un utilisateur en base avec l'email

        #verifie si le user existe bien ET si on peut authentifier (bcrypt) avec le mdp
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path
            

        else 
            flash[:danger] = 'Invalid email/password combination'
            render 'new'
        end

    end

    def new

    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

end