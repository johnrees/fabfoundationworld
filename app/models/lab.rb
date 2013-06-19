class Lab < ActiveRecord::Base

  has_paper_trail
  has_many :opening_times
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  KINDS = %w(fab_lab mini_fab_lab planned_fab_lab)

  validates :name, presence: true
  validates :address, :postal_code, :kind, presence: true

  state_machine :initial => :unverified do
    event :verify do
      transition :unverified => :verified
    end
  end

  def to_s
    name
  end

  def self.kinds_for_select
    KINDS.each_with_index.map do |kind, index|
      [kind.humanize.titleize, index]
    end
  end

  def country
    # country_code
    Carmen::Country.coded("GB").name
  end

private

  def slug_candidates
    [ :name, [ :name, :country ] ]
  end

end
