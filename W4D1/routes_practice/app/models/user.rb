# == Schema Information
#
# Table name: users
#
#  id    :bigint(8)        not null, primary key
#  name  :string
#  email :string
#

class User < ApplicationRecord
  validates :name, :email, presence: true, uniqueness: true

end
