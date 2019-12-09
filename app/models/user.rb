class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    #メールアドレス用バリデーション
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
    #名前用のバリデーション
    VALID_KANJIL_REGEX = /\A[ぁ-んァ-ン一-龥a-zA-Z]/

  validates :nickname, presence: true, uniqueness: true
  validates :family_name, presence: true,format: {with: VALID_KANJIL_REGEX}, allow_blank: true
  validates :first_name, presence: true,format: {with: VALID_KANJIL_REGEX}, allow_blank: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true, uniqueness: true,format: { with: VALID_EMAIL_REGEX },uniqueness: true,allow_blank: true
  validates :encrypted_password, presence: true,length:{minimum:6},format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は英字と数字の両方を含めて設定してください"}
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :phone_number, presence: true, uniqueness: true,format: {with:/\A\d{11}\z/}

        end
