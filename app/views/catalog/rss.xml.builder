xml.instruct! :xml, version: '1.0', encoding: 'UTF-8'

xml.rss('version' => '2.0', 'xmlns:dc' => 'http://purl.org/dc/elements/1.1/') do
  xml.channel do
    xml.title @page_title
    xml.link(url_for(action: 'index', only_path: false))
    xml.ttl '40'
    xml.description 'Dream Library: Books for people'

    @books.each do |book|
      xml.item do
        xml.title(book.title)
        xml.description("#{book.title} by #{book.author_names}")
        xml.pubDate(book.created_at.to_s(:long))
        xml.guid(url_for(action: 'show', id: book, only_path: false))
        xml.link(url_for(action: 'show', id: book, only_path: false))
      end
    end
  end
end
