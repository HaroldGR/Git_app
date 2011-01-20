class UsersController < ApplicationController

  def index
    @users=User.find(:all)
   end

  def new
    @user=User.new
    @title='Sing up'
    key = OpenSSL::PKey::RSA.new(1024)
    @public_modulus  = key.public_key.n.to_s(16)
    @public_exponent = key.public_key.e.to_s(16)
    session[:key] = key.to_pem


  end


  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "El user se guardó satisfactoriamente..!!"
    else
      flash[:notice] = "El user NO se guardó..!!"
      @title = "Sign up"
      render 'new'
    end

  end

  def edit
  @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
  @user.update_attributes(params[:user])
  end

  def destroy
  @user = User.find(params[:id])
  @user.destroy
  end
end
