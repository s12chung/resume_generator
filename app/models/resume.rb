class Resume < HashTreeRecord
  belongs_to :address
  has_many :sections, :dependent => :destroy

  #exception keys for create_from_hash_tree() algorithm
  @formatted_hash_keys = ["address"]

  #given a key and value, do something else
  def self.format_hash_exceptions(key, value)
    #find the address row that contains line_1
    address = Address.find_by_line_1(value["line_1"])
    if address.nil?: address = Address.create_from_hash_tree(value) end
    address
  end

  #loads public/<filename> yaml file, by default it reads public/data.yml
  def self.load_data(filename="data.yml")
    yaml = YAML.load_file(File.join(Rails.root, "public", filename))
    #for each hash pair
    yaml.each_pair do |key, value|
      #if the resume exists
      resume = Resume.find_by_resume_name key
      #delete from database and associated data
      if resume: resume.destroy end
      #create database entries from hash, see app/models/hash_tree_record.rb
      create_from_hash_tree value.merge!("resume_name" => key)
    end
  end
end
