# frozen_string_literal: true

class Attendance < ApplicationRecord
  belongs_to :member
  belongs_to :event

  validates :member_id, presence: true
  validates :event_id, presence: true
  validates :member_id, uniqueness: { scope: :event_id, message: 'can only attend an event once' }

  scope :for_event, ->(event_id) { where(event_id: event_id) }
end
