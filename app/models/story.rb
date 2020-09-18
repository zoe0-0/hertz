class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel

  after_commit :create_story_notification, on: :create

  def create_story_notification
    # Psher.trigger(chann el, eventm, info)
    Pusher.trigger('broadcast_owner', 'create_story', self.as_json.merge(email: self.user.email, date: self.created_at.strftime("%Y-%m-%d %H:%M")))
  end
end
