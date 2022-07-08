require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
         
  # Twitter認証ログイン用
  # ユーザーの情報があれば探し、無ければ作成する
  def self.find_for_oauth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    image_url = auth[:info][:image]
    uri = URI.parse(image_url) # パースする必要がある
    image = uri.open
    email = User.dummy_email(auth)
    password = Devise.friendly_token[0, 20]

    find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = user_name
      user.email = email
      user.password = password
      user.image.attach(io: image, filename: "#{user.name}_profile.png")
    end
  end

  # ダミーのメールアドレスを作成
  def self.dummy_email(auth)
    "#{Time.now.strftime('%Y%m%d%H%M%S').to_i}-#{auth.uid}-#{auth.provider}@example.com"
  end
end
