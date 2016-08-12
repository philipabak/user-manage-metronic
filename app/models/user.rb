require 'users_helper'
require 'user_mailer'

class User < ActiveRecord::Base

  # belongs_to :referrer, class_name: 'User', foreign_key: 'referrer_id'
  # has_many :referrals, class_name: 'User', foreign_key: 'referrer_id'

  def find_by_sql(sql, binds = [])
    connection.select_all(sanitize_sql(sql), "#{name} Load", binds).collect! { |record| instantiate(record) }
  end

end
