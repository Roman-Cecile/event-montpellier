class Event < ApplicationRecord
    has_many :attendances, foreign_key: 'attended_event_id' #event a plusieurs présence
    has_many :users, through: :attendances #event a donc plusieurs users qui, par leur présence (attendance) assistent à l'event (=attended_event)
    belongs_to :administrator, class_name: "User" #event est administré par un seul admin qui est de la classe User et pas besoin de passer par la table attendance

end
