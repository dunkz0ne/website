class AddColumnTeamToRelease < ActiveRecord::Migration[6.1]
  def change
    add_reference :releases, :team, null: false, foreign_key: true
  end
end
