class Device < ActiveRecord::Base
  validates_uniqueness_of :mobile_uuid

  def push
    c2dm = C2DM::Push.new("sorensonapp@gmail.com", "4sorenson", "TestApp")
    c2dm.send_notification(registration_id, "Hello World")
  end
end
