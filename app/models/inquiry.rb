class Inquiry < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :subject, :description
  validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates_uniqueness_of :description, scope: :email
end
