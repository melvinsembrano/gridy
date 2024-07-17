module Gridy
  module ViewHelpers
    include Turbo::FramesHelper
    include Pagy::Frontend

    def gridy_search_url
      uri = URI(request.url)
      params = Rack::Utils.parse_query(uri.query)
      params.delete("page")
      uri.query = params.to_query
      uri.to_s
    end

    def gridy_table_header(field, title = nil, sortable: false)
      unless sortable
        return content_tag(:th, title || field.to_s.titleize)
      end

      uri = URI(request.url)
      params = Rack::Utils.parse_query(uri.query)

      if params["sort"].to_s.start_with?(field.to_s)
        icon = params["sort"].to_s.end_with?("asc") ? "▲" : "▼"
      else
        icon = ""
      end

      params["sort"] = "#{field} #{params["sort"] == "#{field} asc" ? "desc" : "asc"}"
      uri.query = params.to_query

      link_to(uri.to_s, class: "") do
        content_tag(:span, "#{title || field.to_s.titleize} #{icon}".html_safe)
      end
    end
  end
end
