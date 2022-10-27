--DROP TABLE campaign
CREATE TABLE campaign(
	cf_id VARCHAR NOT NULL,
	contact_id VARCHAR NOT NULL,
	company_name VARCHAR NOT NULL,
	description VARCHAR NOT NULL,
	goal VARCHAR NOT NULL,
	pledged VARCHAR NOT NULL,
	outcome VARCHAR NOT NULL,
	backers_count VARCHAR NOT NULL,
	country VARCHAR NOT NULL,
	currency VARCHAR NOT NULL,
	launched_date VARCHAR NOT NULL,
	end_date VARCHAR NOT NULL,
	category_id VARCHAR NOT NULL,
	subcategory_id VARCHAR NOT NULL,
	FOREIGN KEY (category_id) REFERENCES category (category_id),
	FOREIGN KEY (subcategory_id) REFERENCES subcategory (subcategory_id),
	PRIMARY KEY (cf_id)
);

--DROP TABLE contacts
CREATE TABLE contacts(
	contact_id VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	email VARCHAR NOT NULL,
	PRIMARY KEY (contact_id)
);

CREATE TABLE category(
	category_id VARCHAR NOT NULL,
	category VARCHAR NOT NULL,
	PRIMARY KEY (category_id)
);

CREATE TABLE subcategory(
	subcategory_id VARCHAR NOT NULL,
	subcategory VARCHAR NOT NULL,
	PRIMARY KEY (subcategory_id)
);

--DROP TABLE backers
CREATE TABLE backers(
	backer_id VARCHAR NOT NULL,
	cf_id VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,	
	email VARCHAR NOT NULL,
	FOREIGN KEY (cf_id) REFERENCES campaign (cf_id),
	PRIMARY KEY (backer_id)
);

ALTER TABLE campaign  
ALTER COLUMN backers_count TYPE integer USING (campaign.backers_count::integer);
