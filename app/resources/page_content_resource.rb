class PageContentResource < JSONAPI::Resource
  attributes :tag, :content
  has_one :page
end