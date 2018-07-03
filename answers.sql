/*
1. Select a distinct list of ordered airports codes. Be sure to name the column correctly. Be sure to order the results correctly.
*/

SELECT DISTINCT departAirport Airports from flight;

/*
2. Provide a list of flights with a delayed status that depart from San Francisco (SFO).
*/

SELECT a.name name, f.flightNumber, f.scheduledDepartDateTime, f.arriveAirport, f.status FROM flight f JOIN airline a ON a.ID = f.airlineID WHERE f.departAirport = 'SFO' AND f.status = 'delayed';

/*
3. Provide a distinct list of cities that American Airlines departs from.
*/

SELECT DISTINCT f.departAirport Cities FROM flight f JOIN airline a ON a.ID = f.airlineID WHERE a.name = 'American';

/*
4. Provide a distinct list of airlines that conducts flights departing from ATL.
*/

SELECT DISTINCT a.name Airline FROM flight f JOIN airline a ON a.ID = f.airlineID WHERE f.departAirport = 'ATL';

/*
5. Provide a list of airlines, flight numbers, departing airports, and arrival airports where flights departed on time.
*/

SELECT a.name, f.flightNumber, f.departAirport, f.arriveAirport FROM flight f RIGHT JOIN airline a ON a.ID = f.airlineID WHERE TIME(actualDepartDateTime) - TIME(scheduledDepartDateTime) = 0;

/*
6. Provide a list of airlines, flight numbers, gates, status, and arrival _times_ arriving into Charlotte (CLT) on 10-30-2017. Order your results by the arrival time.
*/

SELECT a.name Airline, f.flightNumber Flight, f.gate Gate, TIME(f.scheduledArriveDateTime) Arrival, f.status Status FROM flight f RIGHT JOIN airline a ON a.ID = f.airlineID WHERE f.arriveAirport = 'CLT' AND DATE(f.scheduledArriveDateTime) = '2017-10-30' ORDER BY f.scheduledArriveDateTime;

/*
7. List the number of reservations by flight number. Order by reservations in descending order.
*/

SELECT f.flightNumber flight, count(r.ID) reservations FROM reservation r JOIN flight f ON r.flightID = f.ID GROUP BY f.flightNumber ORDER BY reservations DESC;

/*
8. List the average ticket cost for coach by airline and route. Order by AverageCost in descending order.
*/

/*
9. Which route is the longest?
*/


/*
10. List the top 5 passengers that have flown the most miles. Order by miles.
*/

/*
11. Provide a list of American airline flights ordered by route and arrival date and time. Your results must look like this:
*/

/*
12. Provide a report that counts the number of reservations and totals the reservation costs (as Revenue) by Airline, flight, and route. Order the report by total revenue in descending order.
*/

/*
13. List the average cost per reservation by route. Round results down to the dollar.
*/


/*
14. List the average miles per flight by airline.
*/

/*
15. Which airlines had flights that arrived early?
*/
