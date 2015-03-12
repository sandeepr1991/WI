# -*- coding: utf-8 -*-

# Scrapy settings for assignment project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/en/latest/topics/settings.html
#

BOT_NAME = 'assignment'

SPIDER_MODULES = ['assignment.spiders']
NEWSPIDER_MODULE = 'assignment.spiders'
DEPTH_LIMIT = 1
DOWNLOAD_DELAY = .5
LOG_LEVEL = 'INFO'

# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'assignment (+http://www.yourdomain.com)'
