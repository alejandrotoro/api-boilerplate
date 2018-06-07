class PageResource < JSONAPI::Resource
  attributes :page_url
  has_many :page_contents
end