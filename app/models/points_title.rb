class PointsTitle < HashTreeRecord
  belongs_to :item
  belongs_to :section
  has_many :points, :dependent => :destroy
end
