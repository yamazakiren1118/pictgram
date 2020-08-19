class User < ApplicationRecord
  validates :name, presence: true, length:{maximum:15}
  validates :email, presence: true, format:{with:/\A.+@.+[\.].+\z/}
  validates :password, length: {in: 8..32}, format:{with:/\A.*(?=.*[A-Za-z])(?=.*[0-9]).*\z/}

  # validates :password, length: {minimum:8}
  # validates :password, length: {maximum:32}
  # validates :password, format:{with:/\A.*(?=.*[A-Za-z])(?=.*[0-9]).*\z/}
  # validates :email, format:{with:/\A.+@.+[\.].+\z/}
  # validates :name, length:{maximum:15}

  # -----------------------------------------------

  # validates :name, presence: true
  # validates :email, presence: true
  #
  # # validates :password, length: {minimum:8}
  # # validates :password, length: {maximum:32}
  #
  # validates :password, length: {in: 8..32}
  # validates :password, format:{with:/\A.*(?=.*[A-Za-z])(?=.*[0-9]).*\z/}
  #
  # validates :email, format:{with:/\A.+@.+[\.].+\z/}
  # validates :name, length:{maximum:15}

  has_many :topics
  has_many :favorites
  has_many :comments
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_secure_password
end
