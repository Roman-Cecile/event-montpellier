class Attendance < ApplicationRecord
    belongs_to :attended_event, class_name: "Event" #une présence(attendance) appartient à une participation(attended_event). Joint table attendance et Event
    belongs_to :user #une présence(attendance) appartient à un user. Joint table user et attendance
end
