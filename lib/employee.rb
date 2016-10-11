class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_inclusion_of :hourly_rate, in: 40..200
  validates :store, presence: true

  before_create do
    self.password = generate_password
  end

  protected
    def generate_password
      characters = [('0'..'9'),('A'..'Z'),('a'..'z')].map { |i| i.to_a }.flatten
      password = (0...8).map{ characters[rand(characters.length)] }.join
    end
end
