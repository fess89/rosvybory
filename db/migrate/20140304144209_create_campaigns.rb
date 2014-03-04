class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.datetime :voting_date
      t.string :status
      t.references :nomination_sources
      t.timestamps
    end
  end
end
