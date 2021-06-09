class Question < ApplicationRecord #::Base

  belongs_to :user

  validates :text, :user, presence:true

  #before_validation :before_validation
  #after_validation :after_validation
  #before_save :before_save
  #before_create :before_create
  #after_create :after_create
  #after_save :after_save

  #before_update :before_update
  #after_update :after_update

  #before_destroy :before_destroy
  #after_destroy :after_destroy

  #['validation', 'save', 'create', 'update', 'destroy'].each do |action|
  #  ['before', 'after'].each do |time|
  #    define_method("#{time}_#{action}") do 
  #      puts "******> #{time} #{action}"
  #    end
  #  end
  #end

end
