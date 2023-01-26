/* Database schema to keep the structure of entire database. */

-- Table to store patient information
CREATE TABLE patients(
id int PRIMARY KEY IDENTITY (1,1),
name varchar,
date_of_birth date
);

-- Table to store medical history information
CREATE TABLE medical_histories(
id int PRIMARY KEY IDENTITY (1,1),
admitted_at timestamp,
patient_id int,
FOREIGN KEY (patient_id) REFERENCES patients(id),
status varchar
);

-- Index for faster searching of medical histories by patient id
CREATE INDEX patient_id_medical_histories_index
ON medical_histories (patient_id);

-- Table to store invoice information
CREATE TABLE invoices(
id int PRIMARY KEY IDENTITY (1,1),
total_amount decimal,
generated_at datetime,
payed_at timestamp,
medical_history_id int,
FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

-- Index for faster searching of invoices by medical history id
CREATE INDEX medical_id_invoices_index
ON invoices (medical_history_id);

-- Table to store treatment information
CREATE TABLE treatments(
id int PRIMARY KEY IDENTITY (1,1),
type varchar,
name varchar
);

-- Table to join treatments and medical histories
CREATE TABLE join_treatments_medical_histories (
id int PRIMARY KEY IDENTITY (1,1),
treatment_id int,
medical_history_id int,
FOREIGN KEY (treatment_id) REFERENCES treatments(id),
FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

-- Index for faster searching of join table by treatment id
CREATE INDEX treatment_id_join_index
ON join_treatments_medical_histories (treatment_id);

-- Index for faster searching of join table by medical history id
CREATE INDEX medical_id_join_index
ON join_treatments_medical_histories (medical_history_id);

-- Table to store invoice items information
CREATE TABLE invoice_items (
id int PRIMARY KEY IDENTITY (1,1),
unit_price decimal,
quantity int,
total_price decimal,
invoice_id int,
treatment_id int,
FOREIGN KEY (treatment_id) REFERENCES treatments(id),
FOREIGN KEY (invoice_id) REFERENCES invoices(id)
);

-- Index for faster searching of invoice items by treatment id
CREATE INDEX treatment_id_invoice_items_index
ON invoice_items (treatment_id);

-- Index for faster searching of invoice items by invoice id
CREATE INDEX invoice_id_invoice_items_index
ON invoice_items (invoice_id);

-- Table to store invoice items information
CREATE TABLE invoice_items (
id int PRIMARY KEY IDENTITY (1,1),
unit_price decimal,
quantity int,
total_price decimal,
invoice_id int,
treatment_id int,
FOREIGN KEY (treatment_id) REFERENCES treatments(id),
FOREIGN KEY (invoice_id) REFERENCES invoices(id)
);

-- Index for faster searching of invoice items by treatment id
CREATE INDEX treatment_id_invoice_items_index
ON invoice_items (treatment_id);

-- Index for faster searching of invoice items by invoice id
CREATE INDEX invoice_id_invoice_items_index
ON invoice_items (invoice_id);