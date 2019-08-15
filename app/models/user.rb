class User < ApplicationRecord
    has_many :attendances #représente les plusieurs présences d'un user à un event
    has_many :attended_events, through: :attendances, class_name: "Event" #user a plusieurs participations grâce sa présence(attendance) et cela concerne alors le model Event
    has_many :administrated_events, class_name: "Event" #user peut administré plusieurs event qu'on nomme administrated_event et concerne aussi le model Event
end
