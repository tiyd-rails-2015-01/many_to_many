class AddJoinTable < ActiveRecord::Migration
  def change
    create_table :achievements_people, :id => false do |t|
      t.references :achievement
      t.references :person
    end
  end
end
