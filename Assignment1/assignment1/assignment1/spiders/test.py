from xml.etree import ElementTree
from xml.etree.ElementTree import Element
from xml.etree.ElementTree import SubElement
import lxml.etree as etree

membership = Element('membership')

users = SubElement(membership,'users')

SubElement(users,'user',name='john')
SubElement(users,'user', name='charles')

output_file = open('file.xml','w')
output_file.write(ElementTree.tostring(membership))
output_file.close()
x = etree.parse('file.xml')
print etree.tostring(x,pretty_print=True)