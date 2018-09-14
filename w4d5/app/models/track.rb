# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  ord        :integer          not null
#  regular    :boolean          default(TRUE)
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :title, :ord, presence: true
  validates :regular, inclusion: [true, false]

  belongs_to :album

  has_one :band,
  through: :album,
  source: :band

end
