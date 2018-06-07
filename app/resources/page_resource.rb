class PageResource < JSONAPI::Resource
  attributes :page_url, :page_contents

  def page_contents
    @model.page_contents.pluck(:tag, :content)
  end
end