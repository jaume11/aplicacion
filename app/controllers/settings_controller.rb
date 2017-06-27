class SettingsController < ApplicationController
	before_action :authenticate_user!
	layout "admin"

  def index
  	@user = current_user
  	@setting = current_user.setting
  	@payment = Payment.where(user_id: @user.id).all
  end
	def show
	  @setting = Setting.find(params[:id])
	end
	def create
  	@setting = current_user.build_setting(setting_params)

	  if @setting.save
	    redirect_to settings_path
	  else
	    render :new
	  end
	end
  def new
    @setting = current_user.build_setting
  end
# a partir de aqui es prueba
	def edit
  	@setting = Setting.find(params[:id])
	end
	def update
 	 	@setting = Setting.find(params[:id])
 
  	if @setting.update_attributes(setting_params)
   	redirect_to settings_path
  	else
		render :edit
  	end
	end
	private
		def setting_params
  	params.require(:setting).permit(:country,:language)
	end
end
