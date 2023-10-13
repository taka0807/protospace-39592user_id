class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end
end


# ActionController::Base は親モデル。<は親を継承する。
# ApplicationControllerはすべてのコントローラーに内容を発動する。
# 全てのコントローラーに発動したくない場合は、コントローラー別に記載する。
# if: :devise_controller?デバイスコントローラーが発動する前に[:name, :profile, :occupation, :position])新規登録は出来るようにする。
