import urllib

htmlfile = urllib.urlopen("http://www.moma.org/collection/browse_results.php?criteria=O%3ADE%3AI%3A3|G%3AHI%3AE%3A1&page_number=1&template_id=6&sort_order=2")

htmltext = htmlfile.read()

print htmltext
