class AddSchoolClassToUsers < ActiveRecord::Migration[8.1]
  def change
    add_reference :users, :school_class, null: true, foreign_key: true
  end
end
