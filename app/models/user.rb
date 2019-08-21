class User < ApplicationRecord
    #Les lignes ci dessous demandent a devise d'effectuer certaines actions précisent sur le model User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :attendances #représente les plusieurs présences d'un user à un event
    has_many :attended_events, through: :attendances, class_name: "Event" #user a plusieurs participations grâce sa présence(attendance) et cela concerne alors le model Event
    has_many :administrated_events, class_name: "Event" #user peut administré plusieurs event qu'on nomme administrated_event et concerne aussi le model Event
end
