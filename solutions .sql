describe authors;
select au_id, au_lname, au_fname from authors;
select title from titles;
select pub_name from publishers;

SELECT 
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    t.title AS "TITLE",
    p.publisher_name AS "PUBLISHER"
FROM
    authors as a
    JOIN titleauthor ON a.author_id = ta.author_id
    JOIN titles ON ta.title_id = t.title_id
    JOIN publishers ON t.publisher_id = p.publisher_id
ORDER BY 
    a.author_id;
    
    SELECT 
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    p.publisher_name AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE COUNT"
FROM
    authors a
    JOIN titleauthor ta ON a.author_id = ta.author_id
    JOIN titles t ON ta.title_id = t.title_id
    JOIN publishers p ON t.publisher_id = p.publisher_id
GROUP BY 
    a.author_id, p.publisher_name
ORDER BY 
    a.author_id;
    
    SELECT 
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    SUM(t.sold_copies) AS "TOTAL"
FROM
    authors a
    JOIN titleauthor ta ON a.author_id = ta.author_id
    JOIN titles t ON ta.title_id = t.title_id
GROUP BY 
    a.author_id
ORDER BY 
    TOTAL DESC
LIMIT 3;
SELECT 
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    COALESCE(SUM(t.sold_copies), 0) AS "TOTAL"
FROM
    authors a
    LEFT JOIN titleauthor ta ON a.author_id = ta.author_id
    LEFT JOIN titles t ON ta.title_id = t.title_id
GROUP BY 
    a.author_id
ORDER BY 
    TOTAL DESC;
    
    
    
