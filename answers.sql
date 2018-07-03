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

SELECT a.name airline, f.departAirport, f.arriveAirport, avg(r.cost) AverageCost FROM flight f JOIN airline a ON a.ID = f.airlineID JOIN reservation r ON r.flightID = f.ID WHERE r.class = 'coach' GROUP BY f.flightNumber ORDER BY AverageCost DESC;

/*
9. Which route is the longest?
*/

SELECT f.departAirport, f.arriveAirport, max(f.miles) miles FROM flight f;

/*
10. List the top 5 passengers that have flown the most miles. Order by miles.
*/

SELECT p.firstName, p.lastName, sum(f.miles) miles FROM passenger p JOIN reservation r ON p.ID = r.passengerID JOIN flight f ON f.ID = r.flightID GROUP BY p.ID ORDER BY miles DESC, p.firstName, p.lastName LIMIT 5;
/*
11. Provide a list of American airline flights ordered by route and arrival date and time. Your results must look like this:
*/

SELECT a.name Name, concat_ws(' --> ',f.departAirport, f.arriveAirport) Route, DATE(f.scheduledArriveDateTime) `Arrive Date`, TIME(f.scheduledArriveDateTime) `Arrive Time` FROM flight f JOIN airline a ON a.ID = f.airlineID WHERE a.name = 'American' ORDER BY Route, `Arrive Date`, `Arrive Time`;

/*
12. Provide a report that counts the number of reservations and totals the reservation costs (as Revenue) by Airline, flight, and route. Order the report by total revenue in descending order.
*/

SELECT a.name Name, f.flightNumber Flight, concat_ws(' --> ',f.departAirport, f.arriveAirport) Route, count(r.ID), sum(r.cost) Revenue FROM flight f JOIN airline a ON a.ID = f.airlineID JOIN reservation r ON r.flightID = f.ID GROUP BY f.flightNumber ORDER BY Revenue DESC;

/*
13. List the average cost per reservation by route. Round results down to the dollar.
*/

SELECT concat_ws(' --> ',f.departAirport, f.arriveAirport) Route, floor(avg(r.cost)) `Avg Revenue` FROM flight f JOIN reservation r ON r.flightID = f.ID GROUP BY f.flightNumber ORDER BY `Avg Revenue` DESC;

/*
14. List the average miles per flight by airline.
*/

SELECT a.name Airline, avg(f.miles) `Avg Miles Per Flight` FROM flight f JOIN airline a ON a.ID = f.airlineID GROUP BY Airline;

/*
15. Which airlines had flights that arrived early?
*/

SELECT DISTINCT a.name Airline FROM flight f JOIN airline a ON a.ID = f.airlineID WHERE TIME(actualArriveDateTime) - TIME(scheduledArriveDateTime) <= 0;
