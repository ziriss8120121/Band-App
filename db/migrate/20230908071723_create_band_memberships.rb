class CreateBandMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :band_memberships do |t|
      t.references :band, foreign_key: true
      t.references :user, foreign_key: true
      t.string :instrument

      t.timestamps
    end
  end
end
