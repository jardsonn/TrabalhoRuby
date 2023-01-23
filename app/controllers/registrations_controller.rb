class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  before_action :validate_name, only: [:create, :update,]
  # before_action :validate_name, only: [:update,]

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        redirect_to root_path
        # respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def update
    super
  end

def new
    super
  end

  def destroy
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:birthdate])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private
  # def users_params
  #   params.require(:user).permit(:name, :marca, :valor_aluguel, :placa, :imagemUrl)
  # end

  def validate_name
    if params[:user][:name].nil? || params[:user][:name] == ""
      flash[:empty_name] = "Nome é obrigatório"
      # redirect_to new_user_registration_path, alert: "Field name can't be blank"
      redirect_to new_user_registration_path
    end
  end
end
