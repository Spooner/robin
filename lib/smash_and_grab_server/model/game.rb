class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :scenario, type: String
  field :players, type: Array
  field :mode, type: String
  field :initial, type: String # Essentially, this is the .sgl file.
  has_and_belongs_to_many :player # Well, 2 :)
  embeds_many :turns
  
  def create_turn?(number) 
    (number == 0 || turns.where(number: number - 1)).exists? &&
         !turns.where(number: number).exists?
  end  
end