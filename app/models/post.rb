class FictionValidator < ActiveModel::Validator
  def validate(record)
    unless record.category == 'Fiction' || record.category == "Non-Fiction"
      record.errors[:category] << ' must be fiction or non-fiction'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with FictionValidator

  validates :title, presence: true
  validates :content, length: { minimum: 100 }
end
