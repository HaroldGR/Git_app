class UsersController < ApplicationController


  def index
    @users=User.find(:all)
   end

  def new
    @user=User.new
 end


  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "El user se guardó satisfactoriamente..!!"
    else
      flash[:notice] = "El user NO se guardó..!!"
      @title = "Sign up"
      render :action => :new
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
  flash[:notice] = "el user "+@user.nombre+" eliminado con éxito"
  @user.destroy
  end
end
