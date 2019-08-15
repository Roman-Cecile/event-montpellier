class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id
      t.belongs_to :user #attenance appartient à User donc on veut voir dans le tableau son ID (ce sera l'admin). pas d'index car class User existe
      t.belongs_to :attended_event, index: true #affiche l'id de l'event assisté. on met un index pour créer une colone car class attended_event nexiste pas, elle s'appui sur la class Event

      t.timestamps
    end
  end
end
