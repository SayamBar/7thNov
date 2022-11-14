require 'rails_helper'

RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:article_1) { create(title:'vfv', body:'article without trait') } # article without trait
  let(:article_2) {create(:article, :uniqueness)}

  let(:article_3) {create(:article, body:'article')}
  let(:comment_1) {create(:comment, article:article_3)}
  let(:comment_2) {create(:comment, commenter:'Commenter1', article:article_3)}

  count = 0
  let!(:count) { count += 1 }

  it "returns 1" do
    expect(count).to eq(1)
  end

  context "validation test" do
    it 'ensures title presence' do
      article = Article.new(title:'Title',body:'Body').save
      expect(article).to eq(true)
    end

    it 'ensures body presence' do
      article = Article.new(title:'Title').save
      expect(article).to eq(false)
    end
    it 'should save successfully' do
      article = Article.new().save
      expect(article).to eq(false)
    end
    it 'comment' do
      expect(comment_1.commenter).to eq('Commenter')
    end
  end
  it 'ensures default title matches' do
    article=create(:article, body:'abc')
    expect(article.title).to eq 'A'
  end
  it 'should save successfully' do
    # article=create(:article, )
     
    expect(article_1.body).to eq('article without trait')
    expect(article_2.body).to eq('When working with uniqueness constraints, be careful not to pass in override values that will conflict with the generated sequence values.')
    # expect(article).to eq(true)
  end
  it 'has writer' do
    expect(article_2.writer).to eq('Writer')
  end
  it 'article has many comments' do
    expect(comment_1.article.body).to eq 'article'
    expect(comment_2.article.body).to eq 'article'
  end

end
