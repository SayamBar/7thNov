require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:article_1) {create(:article, body:"article")}
  it 'ensures default commenter matches' do
    comment = create(:comment, article_id: article_1.id)
    expect(comment.body).to eq('Comment')
  end

  it 'ensures article body' do
    comment = create(:comment, article:article_1)
    expect(comment.article.body).to eq('article')
  end

  it 'ensures article must be present' do
    comment = build(:comment).save
    expect(comment).to_not be_valid
  end
  
  it "has none to begin with" do
    expect(Comment.count).to eq 0
  end

  it "has one after adding one" do
    Comment.create(:comment)
    expect(Comment.count).to eq 1
  end

  subject { Comment.new(commenter:"sgvgv",body:"vweve",article:article_1)}
  it "is not valid without a commenter" do
    subject.commenter = nil
    expect(subject).to be_valid
  end

  it "is valid with valid attribute" do
    expect(subject).to be_valid
  end

  it "is valid with valid attribute" do
    expect(subject.errors).to be_empty
  end
    
end
