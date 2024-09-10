SELECT 
    c.id AS client_id, 
    c.corporate_name, 
    p.phone_number,
    s.acronym
FROM 
    "Clients" c
JOIN 
    "States" s ON c.state_id = s.id
JOIN 
    "Phones" p ON c.id = p.client_id
WHERE 
    s.acronym = 'SP';
