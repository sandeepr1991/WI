import scrapy
from scrapy.contrib.spiders import CrawlSpider, Rule
from scrapy.selector import HtmlXPathSelector
from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor
from scrapy.http import Request
from xml.etree import ElementTree
from xml.etree.ElementTree import Element,tostring
from xml.etree.ElementTree import SubElement
import lxml.etree as etree

Arts = Element('Arts')
class assignment1(CrawlSpider):
    name="assignment1"
    allowed_domains=['moma.org']
    start_urls = ['http://www.moma.org/collection/browse_results.php?criteria=O%3ADE%3AI%3A5%7CG%3AHI%3AE%3A1&template_id=6&sort_order=2&results_per_page=300&page_number=1&UC=']

    
    rules = (
    	Rule(SgmlLinkExtractor(allow=("moma.org",)), callback="parse_item"),
    	)
    def parse_item(self, response):
    	response = HtmlXPathSelector(response)
    	for link in response.xpath('//*[@id="thumbnail-view-items"]/li'):
    		if(len(link.xpath('a/@href').extract())>0):
    			url = "http://www.moma.org/collection/"+link.xpath('a/@href').extract()[0]
    		else:
    			continue
    		#url ="http://www.moma.org/collection/browse_results.php?criteria=O%3ADE%3AI%3A1%7CG%3AHI%3AE%3A1&page_number=1&template_id=1&sort_order=2"
    		#print url
    		request = scrapy.Request(url, callback=self.parseData)
    		output_file = open('file.xml','w')
    		output_file.write(ElementTree.tostring(Arts))
    		output_file.close()
    		x = etree.parse('file.xml')
    		output_file = open('file.xml','w')
    		output_file.write(etree.tostring(x,pretty_print=True))
    		output_file.close()
    		yield request
    		#tree.write("filename.txt")

    def parseData(self, response):
    	#item = Assignment1Item()
    	response = HtmlXPathSelector(response)
    	typeArtist = response.xpath('//*[@id="middle"]/div[4]/div[2]/div[2]/div/div[1]/div[3]/div/a/span/text()').extract()
    	if(len(typeArtist)>0):
    		typeArtist=typeArtist[0]
    	else:
    		return

    	if(typeArtist.find('Painting')==-1):
    		return
    	Data = response.xpath('//*[@id="omniture_caption"]')
    	#print Data.xpath('h3/i/text()').extract()
    	title =''
    	artist =''
    	date = ''
    	medium = ''
    	serialNo = ''
    	copyright = ''
    	
    	
    	if (len(Data.xpath('h3/i/text()').extract())>0):
    		date_copy = Data.xpath('dl/dd[1]/text()').extract()[0]
    		date = date_copy
    		if(date.find('-')!=-1):
    			date=date[0:date.find('-')]
    		elif (date.find(',')!=-1):
    			pos = date.find(',')
    			pos=pos+2
    			date=date[pos:len(date)]
    		elif (date.find('(')!=-1):
    			date=date[1:len(date)-1]
    		elif (date.find('/')!=-1):
    			date=date[0:date.find('/')]
    		try:
    			date=float(date)
    			date=int(date)
    		except:
    			return
    		if(date<1700):
    			return
    		Art = SubElement(Arts,'Art')
    		SubElement(Art,'Date',value=date_copy)
    		title = Data.xpath('h3/i/text()').extract()[0]
    		SubElement(Art,'Title',value=title)
    		artist = Data.xpath('h4/a/text()').extract()[0]
    		SubElement(Art,'Artist',value=artist)
    		medium = Data.xpath('dl/dd[2]/text()').extract()[0]
    		SubElement(Art,'Medium',value=medium)
    		dimension = Data.xpath('dl/dd[3]/text()').extract()
    		if(len(dimension)>0):
    			dimension=dimension[0]
    			SubElement(Art,'Dimension',value=dimension)
    		image = response.xpath('//*[@id="mainImage"]/img/@src').extract()
    		if(len(image)>0):
    			image = image[0]
    			SubElement(Art,'Image',value=image)
    		status = response.xpath('//*[@id="middle"]/div[3]/div[1]/div[1]/strong/text()').extract()
    		if(len(status)>0):
    			status = status[0]
    			SubElement(Art,'Status',value=status)
    		acquired = response.xpath('//*[@id="middle"]/div[4]/div[1]/p/text()').extract()
    		if(len(acquired)>0):
    			acquired = acquired[0]
    			SubElement(Art,'Acquired',value=acquired)
    		Credit = Data.xpath('dl/dd[4]/text()').extract()
    		if(len(Credit)>0):
    			Credit=Credit[0]
    			SubElement(Art,'Credit',value=Credit)
    		SubElement(Art, 'Category',value=typeArtist)		

    	#print title,artist,date,medium,serialNo,copyrigh
		

    	

   			 			