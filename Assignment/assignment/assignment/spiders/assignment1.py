from scrapy.contrib.spiders import CrawlSpider, Rule
from scrapy.selector import HtmlXPathSelector
from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor
from scrapy.http import Request

class assignment1(CrawlSpider):
    name="assignment1"
    allowed_domains=['wikipedia.org']
    start_urls = ['http://en.wikipedia.org/wiki/Mathematics']

    rules = (
    	Rule(SgmlLinkExtractor(restrict_xpaths=('//div[@class="mw-body"]//a/@href'))),
    	Rule(SgmlLinkExtractor(allow=("http://en.wikipedia.org/wiki/",)), callback="parse_item"),
    	)

    def parse_item(self, response):
    	response = HtmlXPathSelector(response)
    	print response.xpath('//h1[@class="firstHeading"]/span/text()').extract()  
    	


      



