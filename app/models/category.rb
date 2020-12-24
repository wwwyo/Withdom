class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: 'ITニュース'},
    {id: 2, name: 'プログラミング'},
    {id: 3, name: 'デザイン'},
    {id: 4, name: 'ビジネス'},
    {id: 5, name: 'プレゼンテーション'},
    {id: 6, name: '仕事術'},
    {id: 7, name: '自己啓発'},
    {id: 8, name: '健康管理'},
    {id: 9, name: 'メンタルケア'},
    {id: 10, name: '政治ニュース'},
    {id: 11, name: '文化・思想'},
    {id: 12, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :shares
end