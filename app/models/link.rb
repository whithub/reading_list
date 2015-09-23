# require 'uri'

class Link < ActiveRecord::Base
  belongs_to :user

  validates :url, url: true
  # validates :url, :url => {:allow_nil => true}
  # validates :url, :url => {:allow_blank => true}
  # validates :url, :url => {:no_local => true}


  enum status: { unread: 0, read: 1 }

  include AASM
  aasm column: :status, enum: true do
    state :unread, :initial => true
    state :read

    event :have_read do
      transitions from: :unread, to: :read
    end

    event :have_not_read do
      transitions from: :read, to: :unread
    end
  end

  # def valid?(uri)
  #   !!URI.parse(uri)
  # rescue URI::InvalidURIError
  #   false
  # end

end
