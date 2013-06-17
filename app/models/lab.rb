class Lab < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :name, presence: true

  state_machine :initial => :unverified do
    event :verify do
      transition :unverified => :verified
    end
  end

private

  def slug_candidates
    [ :name, [ :name, :country ] ]
  end

end
