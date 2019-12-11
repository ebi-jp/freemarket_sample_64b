class SignupController < ApplicationController
  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:nickname] = user_path[:nickname]
  #   session[:email] = user_params[:email]
  #   session[:encrypted_password] = user_params[:encrypted_password]
  #   session[:family_name] = user_params[:family_name]
  #   session[:first_name] = user_params[:first_name]
  #   session[:family_name_kana] = user_params[:family_name_kana]
  #   session[:first_name_kana] = user_params[:first_name_kana]
  #   @user = User.new # 新規インスタンス作成
  end

  # def step3
  #   # step2で入力された値をsessionに保存
  #   session[:phone_number] = user_params[:phone_number]
  #   @user = User.new
  # end



  private
　# 許可するキーを設定します
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :encrypted_password, 
      :family_name, 
      :first_name, 
      :family_name_kana, 
      :first_name_kana, 
  )
  end
end
