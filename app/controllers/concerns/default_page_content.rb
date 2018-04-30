module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Joshua Ard | Portfolio"
    @seo_keywords = "Joshua Ard portfolio"
  end
end
