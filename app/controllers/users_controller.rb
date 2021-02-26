class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :authorize, only: [:new, :create]
  
    # GET /users
    # GET /users.json
    def index
      redirect_to root_path
    end
  
    # GET /users/1
    # GET /users/1.json
    def show
    end
  
    # GET /users/new
    def new
      if session[:user_id] == nil
        @user = User.new
      else
        redirect_to root_path
      end
    end
  
    # GET /users/1/edit
    def edit
      redirect_to root_path if @current_user.id != @user.id
    end
  
    # POST /users
    # POST /users.json
    def create
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to sessions_new_path, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      # 
      respond_to do |format|
        if @user.update(user_params)
          @user.update(changed_password: "true")
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:name, :hashed_password, :salt, :password, :password_confirmation)
      end
  end
  