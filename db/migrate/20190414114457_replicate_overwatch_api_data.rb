class ReplicateOverwatchApiData < ActiveRecord::Migration[5.2]
  def self.up
    service = OverwatchService.new
    service.replicate_data
  end

  def self.down
    Hero.delete_all
    Ability.delete_all
  end
end
