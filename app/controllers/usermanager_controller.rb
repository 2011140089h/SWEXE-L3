class UsermanagerController < ApplicationController
    def signin
        # none
    end
    
    def create_user
        if User.find_by(uid: params[:uid])
            flash[:notice]= params[:uid]+" is already exsist!"
            render "signin"
            return
        end
            
        @register=User.new(uid: params[:uid], password: params[:password], password_confirmation: params[:password_confirmation])
        
        if @register.save
            flash[:notice]="user create success!"
            redirect_to root_path
        else
            render "signin"
        end
    end
    
    def delete_user
    end
    
    def login
        # none
    end
    
    def checklogin
        if User.find_by(uid: params[:uid])
            userpass=User.find_by(uid: params[:uid]).pass
            
            if BCrypt::Password.new(userpass)==params[:password]
                session[:userid]=params[:uid]
                redirect_to root_path
            else
                session[:userid]=nil
                flash[:notice]="not match password"
                render "login"
            end
            
        else
            flash[:notice] = "not match userid"
            render "login"
        end
    end
    
    def logout
        session.delete(:userid)
        redirect_to root_path
    end
end
