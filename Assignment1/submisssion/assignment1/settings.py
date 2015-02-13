# -*- coding: utf-8 -*-

# Scrapy settings for assignment project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/en/latest/topics/settings.html
#

BOT_NAME = 'assignment1'

SPIDER_MODULES = ['assignment1.spiders']
NEWSPIDER_MODULE = 'assignment1.spiders'
DEPTH_LIMIT = 2
LOG_LEVEL = 'INFO'

# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'assignment (+http://www.yourdomain.com)'
