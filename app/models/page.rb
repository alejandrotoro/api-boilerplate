class Page < ActiveRecord::Base
  has_many :page_contents

  validates :page_url, presence: true
  validate :is_accessible?

  after_create :set_page_content

  def set_page_content
    body = HTTParty.get(page_url).body
    page_content = Nokogiri::HTML(body)
    %w(h1 h2 h3 a).each do |e|
      page_content.css(e).each do |item|
        if e == "a"
          page_contents.create(tag: 'a', content: item[:href])
        else
          page_contents.create(tag: e, content: item.text)
        end
      end
    end
  end

  def is_accessible?
    success = begin
      response = ::HTTParty.get(page_url)
      (response.code == 200 || response.code == 302)
    rescue
      false
    end
    errors.add(:url, 'The url is not reachable at this moment.') unless success
  end

end