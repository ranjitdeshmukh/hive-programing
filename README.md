# hive-programing

---
page_type: sample
languages:
- python
products:
- azure
- azure-hive
description: "How to use the Azure hive how to writ the script and how to make the preprocess the data using the python."
urlFragment: 

#this-used for the connect with hive in the beeline interfece

beeline -u 'jdbc:hive2://headnodehost:10001/;transportMode=http' -f demo.hql

#this used for the storing the txt file in azure

beeline -u 'jdbc:hive2://headnodehost:10001/;transportMode=http' -f demo.hql >> demo.txt 

---



