class ContestWork < ActiveRecord::Base

  attr_accessible :age, :description, :name, :photo, :work

  validates_presence_of :age, :description, :name, :photo, :work

  has_attached_file :photo,
                    :storage => :elvfs,
                    :elvfs_url => Settings['storage.url'],
                    :restricted_characters => /^.*(?=\.\w+$)/  # look ahead file extension

  has_attached_file :work,
                    :storage => :elvfs,
                    :elvfs_url => Settings['storage.url'],
                    :restricted_characters => /^.*(?=\.\w+$)/  # look ahead file extension

end

# == Schema Information
#
# Table name: contest_works
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  age                :integer
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  photo_url          :text
#  work_file_name     :string(255)
#  work_content_type  :string(255)
#  work_file_size     :integer
#  work_updated_at    :datetime
#  work_url           :text
#

