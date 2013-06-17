class Lab < ActiveRecord::Base

  has_paper_trail
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :name, presence: true
  validates :address, :postal_code, presence: true

  state_machine :initial => :unverified do
    event :verify do
      transition :unverified => :verified
    end
  end

  def country
    Carmen::Country.coded(country_code).name
  end

private

  def slug_candidates
    [ :name, [ :name, :country ] ]
  end

end
