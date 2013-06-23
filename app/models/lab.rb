class Lab < ActiveRecord::Base

  has_paper_trail
  has_many :opening_times
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  KINDS = %w(fab_lab mini_fab_lab planned_fab_lab)

  validates :name, presence: true
  validates :address, :postal_code, :kind, :country_code, presence: true

  state_machine :initial => :unverified do
    event :verify do
      transition :unverified => :verified
    end
  end

  def self.open
    t = Time.now
    joins(:opening_times)
    .where(
      "opening_times.day_of_the_week = ? AND opening_times.minute <= ? AND (opening_times.minute + opening_times.duration) >= ?",
      t.wday,
      (t.hour * 60) + t.min,
      (t.hour * 60) + t.min
    )
    # AND duration <= ?
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
    Country[self.country_code.upcase].name
  end

private

  def slug_candidates
    [ :name, [ :name, :country ] ]
  end

end
