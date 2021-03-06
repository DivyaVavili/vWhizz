class Event < ActiveRecord::Base
  belongs_to :customer
  has_attached_file :poster, :styles => { :small => "150x150>",:medium => "200x200>",:large => "320x240>" },
    :url => "/assets/events/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"

  validates_attachment_size :photo, :less_than => 15.megabytes
  validates_attachment_content_type :photo, :content_type => [ 'image/jpeg','image/png']
  
  def self.find_all_events 
    Events.find(:all, :order=>"date desc", :conditions=>['date > ?',Date.today]) 
  end
end
