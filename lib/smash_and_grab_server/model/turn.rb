class Turn
  include Mongoid::Document
  include Mongoid::Timestamps

  field :actions, type: String # List of actions.
  embedded_in :game
end