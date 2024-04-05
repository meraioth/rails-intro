# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  reaction   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#
class Comment < ApplicationRecord
  belongs_to :post

  enum :reaction, [:like, :dislike]
end
