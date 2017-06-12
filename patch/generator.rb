module Jekyll
  module PDF
    class Generator < Jekyll::Generator
      safe true
      priority :lowest

      def generate(site)

          # Loop through pages & documents and build PDFs

          pages_array = site.pages.clone

          pages_array.each do |item|

            site.pages << Document.new(site, site.source, item) if item.data['pdf']

          end

      end

    end
  end
end
