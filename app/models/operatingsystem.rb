class Operatingsystem < ActiveRecord::Base
  has_many :hosts
  has_many :medias
  validates_presence_of :major, :message => "Operating System version is required"
  validates_presence_of :name

  before_destroy :ensure_not_used

  # The OS is usually represented as the catenation of the OS and the revision. E.G. "Solaris 10"
  def to_label
    "#{name} #{major}#{('.' + minor) unless minor.empty?}"
  end

  def to_s
    to_label
  end

end
