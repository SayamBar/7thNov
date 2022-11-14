require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'ensures default commenter matches' do
    comment=create(:comment)
    expect(comment.body).to eq('Comment')
    article
  end
end
