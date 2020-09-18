class Channel < ActiveRecord::Base
  belongs_to :user
  has_many :diaries
  has_many :timetable
  has_many :stories
  validates_uniqueness_of :frequency
  validates_numericality_of :frequency, :greater_than_or_equal_to => 87.5, :less_than_or_equal_to => 108.0
  validates_uniqueness_of :user_id

  after_commit :update_channel_onair_notification, on: :update

  def update_channel_onair_notification
    # Psher.trigger(chann el, eventm, info)
    if self.onair == 1
      Pusher.trigger("broadcast-#{self.id}", 'onair', self.as_json)
      Pusher.trigger("main", 'onair', self.as_json)
    elsif self.onair == 0
      Pusher.trigger("broadcast-#{self.id}", 'offair', self.as_json)
      Pusher.trigger("main", 'offair', self.as_json)
      self.diaries.last.update(finished_at: self.updated_at)
    end
  end

end
