class ContestVote < ActiveRecord::Base
  attr_accessible :ip, :session_id, :user_agent, :contest_work
  belongs_to :contest_work
end

# == Schema Information
#
# Table name: contest_votes
#
#  id              :integer          not null, primary key
#  ip              :text
#  user_agent      :text
#  session_id      :text
#  contest_work_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

