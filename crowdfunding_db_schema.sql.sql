-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/oHjoFc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Campaign" (
    "cf_id" int64   NOT NULL,
    "contact_id" int64   NOT NULL,
    "company_name" object   NOT NULL,
    "description" object   NOT NULL,
    "goal" float64   NOT NULL,
    "pledged" float64   NOT NULL,
    "outcome" object   NOT NULL,
    "backers_count" int64   NOT NULL,
    "country" object   NOT NULL,
    "currency" object   NOT NULL,
    "launched_date" object   NOT NULL,
    "end_date" object   NOT NULL,
    "category_id" object   NOT NULL,
    "subcategory_id" object   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "Category" (
    "category_id" object   NOT NULL,
    "category" object   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category"
     )
);

CREATE TABLE "Subcategory" (
    "subcategory_id" object   NOT NULL,
    "subcategory" object   NOT NULL,
    CONSTRAINT "pk_Subcategory" PRIMARY KEY (
        "subcategory"
     )
);

CREATE TABLE "Contacts" (
    "contact_ID" int64   NOT NULL,
    "First_Name" object   NOT NULL,
    "Last_Name" object   NOT NULL,
    "email" object   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_ID"
     )
);

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contacts" ("contact_ID");

ALTER TABLE "Category" ADD CONSTRAINT "fk_Category_category_id" FOREIGN KEY("category_id")
REFERENCES "Campaign" ("category_id");

ALTER TABLE "Category" ADD CONSTRAINT "fk_Category_category" FOREIGN KEY("category")
REFERENCES "Category" ("category_id");

ALTER TABLE "Subcategory" ADD CONSTRAINT "fk_Subcategory_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "Campaign" ("subcategory_id");

ALTER TABLE "Subcategory" ADD CONSTRAINT "fk_Subcategory_subcategory" FOREIGN KEY("subcategory")
REFERENCES "Subcategory" ("subcategory_id");

