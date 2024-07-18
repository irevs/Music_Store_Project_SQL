/* Q1: Who is the senior most employee based on job title? */

SELECT  FIRST_NAME,LAST_NAME
FROM EMPLOYEE
ORDER BY LEVELS DESC
LIMIT 1;



/* Q2: Which countries have the most Invoices? */

SELECT COUNT(*) AS C, billing_country
FROM invoice
GROUP BY billing_country 
ORDER BY C DESC;



/* Q3: What are top 3 values of total invoice? */

SELECT TOTAL  FROM invoice
ORDER BY TOTAL DESC
LIMIT 3;




/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */

SELECT SUM(TOTAL) AS INVOICE_TOTAL,BILLING_CITY 
FROM invoice
GROUP BY BILLING_CITY
ORDER BY INVOICE_TOTAL DESC;




/* Q5: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */

## METHOD 1 ##

SELECT distinct(EMAIL), FIRST_NAME,LAST_NAME
FROM customer
JOIN invoice
ON invoice.customer_id = customer.customer_id
JOIN invoice_line
on invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN (
                   SELECT track_id 
                   FROM TRACK
                   JOIN GENRE
                   ON TRACK.GENRE_ID = GENRE.GENRE_ID
                   WHERE GENRE.NAME = "ROCK"
                   )
ORDER BY EMAIL;

## METHOD 2 ##

SELECT distinct(EMAIL), FIRST_NAME,LAST_NAME 
FROM CUSTOMER
JOIN invoice ON INVOICE.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID
JOIN INVOICE_LINE ON INVOICE.INVOICE_ID = invoice_line.invoice_id
JOIN track ON invoice_line.track_id = track.track_id
JOIN GENRE ON GENRE.GENRE_ID = TRACK.GENRE_ID
WHERE GENRE.NAME LIKE "ROCK"
ORDER BY EMAIL;




/* Q6: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

SELECT distinct(artist.artist_id),artist.NAME
FROM TRACK
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id= album.album_id
JOIN GENRE ON genre.genre_id = track.genre_id
WHERE genre.NAME = 'ROCK'
order by artist.artist_id desc
limit 10;




/* Q7: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

SELECT NAME,MILLISECONDS
FROM TRACK
WHERE MILLISECONDS>
          (SELECT AVG(MILLISECONDS) AS AVG_TRACK_LENGHT
            FROM TRACK)
ORDER BY MILLISECONDS DESC;        



















