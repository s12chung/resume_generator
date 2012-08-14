class Item < HashTreeRecord
  belongs_to :section
  has_many :points_titles, :dependent => :destroy  
  has_many :points, :dependent => :destroy

  @formatted_hash_keys = ["start_date", "end_date"]

  def self.format_hash_exceptions(key, value)
    Date.new(value["year"], value["month"])
  end
end
