class Section < HashTreeRecord
  belongs_to :resume
  has_many :items, :dependent => :destroy
  has_many :points_titles, :dependent => :destroy  
  has_many :points, :dependent => :destroy
end
