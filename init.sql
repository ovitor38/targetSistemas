CREATE TABLE "States" (
    id SERIAL PRIMARY KEY,
    state_name VARCHAR(255) NOT NULL,
    acronym CHAR(2) NOT NULL
);

CREATE TABLE "PhoneTypes" (
    id SERIAL PRIMARY KEY,
    description VARCHAR(255) NOT NULL
);

CREATE TABLE "Clients" (
    id SERIAL PRIMARY KEY,
    corporate_name VARCHAR(255) NOT NULL,
    state_id INT,
    FOREIGN KEY (state_id) REFERENCES "States"(id)
);

CREATE TABLE "Phones" (
    id SERIAL PRIMARY KEY,
    phone_number VARCHAR(20) NOT NULL,
    client_id INT,
    phone_type_id INT,
    FOREIGN KEY (client_id) REFERENCES "Clients"(id),
    FOREIGN KEY (phone_type_id) REFERENCES "PhoneTypes"(id)
);

INSERT INTO "States" (state_name, acronym)
VALUES 
    ('São Paulo', 'SP'),
    ('Minas Gerais', 'MG');

INSERT INTO "PhoneTypes" (description)
VALUES 
    ('Comercial'),
    ('residencial'),
    ('celular');

INSERT INTO "Clients" (corporate_name, state_id)
VALUES 
    ('Empresa Test', (SELECT id FROM "States" WHERE acronym = 'SP')),
    ('Beta Comércio', (SELECT id FROM "States" WHERE acronym = 'SP')),
    ('Trem Bão', (SELECT id FROM "States" WHERE acronym = 'MG'));

INSERT INTO "Phones" (phone_number, client_id, phone_type_id)
VALUES 
    ('(11) 1234-5678', (SELECT id FROM "Clients" WHERE corporate_name = 'Empresa Test'), (SELECT id FROM "PhoneTypes" WHERE description = 'Comercial')),
    ('(11) 99555-5555', (SELECT id FROM "Clients" WHERE corporate_name = 'Empresa Test'), (SELECT id FROM "PhoneTypes" WHERE description = 'Celular')),
    ('(11) 9876-5432', (SELECT id FROM "Clients" WHERE corporate_name = 'Beta Comércio'), (SELECT id FROM "PhoneTypes" WHERE description = 'Comercial')),
    ('(11) 5678-1234', (SELECT id FROM "Clients" WHERE corporate_name = 'Trem Bão'), (SELECT id FROM "PhoneTypes" WHERE description = 'Comercial'));