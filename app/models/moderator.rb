# == Schema Information
#
# Table name: moderators
#
#  id         :bigint           not null, primary key
#  sub_id     :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Moderator < ApplicationRecord
    belongs_to :sub,
        foreign_key: :sub_id,
        class_name: :Sub
    
    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User
end
