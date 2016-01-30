require 'rails_helper'
include RandomData

RSpec.describe Favorite, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:favorite) { Favorite.create!(post: post, user: user) }

  it should{belongs_to(:user)}
  it should{belong_to(:post)}
end
