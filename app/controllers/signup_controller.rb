class SignupController < ApplicationController
  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthyear_id] = user_params[:birthyear_id]
    session[:birthmonth_id] = user_params[:birthmonth_id]
    session[:birthday_id] = user_params[:birthday_id]
    @user = User.new # 新規インスタンス作成

  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @user.build_address
  end






  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name], 
      first_name: session[:first_name], 
      family_name_kana: session[:family_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthyear_id: session[:birthyear_id],
      birthmonth_id: session[:birthmonth_id],
      birthday_id: session[:birthday_id],
      phone_number: session[:phone_number]
    )
    @user.build_address(user_params[:address_attributes]) 
    if @user.save
      # ログインするための情報を保管
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to step4_signup_index_path
    else
      render '/signup/step1'
    end
  end



  private
# 許可するキーを設定します
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password,
      :password_confirmation, 
      :family_name, 
      :first_name, 
      :family_name_kana, 
      :first_name_kana, 
      :phone_number,
      :birthyear_id,
      :birthmonth_id,
      :birthday_id,
      address_attributes: [:id,:postal_code, :city,:address,:building,:phone_number,:prefecture_id]
    )
  end
end
