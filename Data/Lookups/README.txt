Contains formatting data and symptom category assignments

Steps to add new symptoms:
1) Manually add the entries into SymptomNames, map the symptoms to an exisitng symptom_name_formatted if possible
2) Use UpdateLookups to update SymptomNamesLookup
3) If any of the new symptoms have a new symptom_id, you will need to manually update SymptomCategories and assing the new symptoms into a category
4) Use UpdateLookups to update SymptomCategoryLookup
5) Use UpdateLookups to create a new SymptomNameCategoryLookup

SymptomCategories:
Level: symptom
A manually created lookup that assigns symptoms to a symptom category. Needs manual updating whenever new symptoms are added that do not fit into existing criteria.

SymptomNames:
Level: dataset
A manually created lookup that has a list of all symptoms in each dataset, and maps them to an exisitng formatted symptom name.

SymptomNamesLookup:
Level: dataset
A lookup created using AssingUniqueID.Rmd where each symptom now has a unique ID

SymptomNameCategoriesLookup:
Level: dataset
Lookup for mapping a symptom from a dataset to it's formatted name and assigned category