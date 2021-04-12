# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  url        :string
#  content    :text
#  sub_id     :integer
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    belongs_to :user,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :sub,
        foreign_key: :sub_id,
        class_name: :Sub
end
