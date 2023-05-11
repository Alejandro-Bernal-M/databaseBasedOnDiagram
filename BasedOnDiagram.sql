CREATE TABLE "patients" (
  "id" int,
  "name" varchar(30),
  "date_of_birth" date,
  PRIMARY KEY ("id")
);

CREATE TABLE "medical_histories" (
  "id" int,
  "admitted_at" timestamp,
  "patient_id" int,
  "status" varchar(40),
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_medical_histories.patient_id"
    FOREIGN KEY ("patient_id")
      REFERENCES "patients"("id")
);

CREATE TABLE "invoices" (
  "id" int,
  "total_amount" decimal,
  "generated_at" timestamp,
  "payed_at" timestamp,
  "medical_history_id" int,
  PRIMARY KEY ("id")
);

CREATE TABLE "treatments" (
  "id" int,
  "type" varchar(40),
  "name" varchar(40),
  PRIMARY KEY ("id")
);

CREATE TABLE "invoice_items" (
  "id" int,
  "unit_price" float,
  "quantity" int,
  "total_price" decimal,
  "invoice_id" int,
  "treatment_id" int,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_invoice_items.invoice_id"
    FOREIGN KEY ("invoice_id")
      REFERENCES "invoices"("id"),
  CONSTRAINT "FK_invoice_items.treatment_id"
    FOREIGN KEY ("treatment_id")
      REFERENCES "treatments"("id")
);

CREATE TABLE "medical_histories_treatments" (
  "medical_histories_id" int,
  "treatment_id" int,
  CONSTRAINT "FK_medical_histories_treatments.medical_histories_id"
    FOREIGN KEY ("medical_histories_id")
      REFERENCES "medical_histories"("id"),
  CONSTRAINT "FK_medical_histories_treatments.treatment_id"
    FOREIGN KEY ("treatment_id")
      REFERENCES "treatments"("id")
);

alter table invoices
add constraint fk_medical_histories_id
foreign key (medical_history_id)
references medical_histories(id)