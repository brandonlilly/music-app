# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  live       :boolean          default("false")
#

class Album < ActiveRecord::Base
  validates :title, :band_id, presence: true
  after_initialize :falsify_live

  belongs_to :band
  has_many :tracks, dependent: :destroy

  private

  def falsify_live
    self.live ||= false
  end
end
