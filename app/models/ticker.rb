class Ticker < ApplicationRecord
  has_one :trading_data
  has_one :historical_date, through: :trading_data

  has_many :ticker_tags
  has_many :tags, through: :ticker_tags

  validates :symbol, :description, presence: true

  def tag_list=(tag_string)
    binding.pry
    tag_names = tag_string.split(",")
                          .collect{|word| word.strip.downcase}
                          .uniq
    tags = tag_names.collect {|tag| Tag.find_or_create_by(title: tag)}
    self.tags = tags
  end

  def tag_list
    self.tags.collect do |tag|
      tag.title
    end.join(", ")
  end
end