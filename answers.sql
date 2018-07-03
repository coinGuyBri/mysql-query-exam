/*
1. Select a distinct list of ordered airports codes. Be sure to name the column correctly. Be sure to order the results correctly.
*/

SELECT DISTINCT departAirport Airports from flight;

/*
2. Provide a list of flights with a delayed status that depart from San Francisco (SFO).
*/

SELECT a.name name, f.flightNumber, f.scheduledDepartDateTime, f.arriveAirport, f.status FROM flight f JOIN airline a ON a.ID = f.airlineID WHERE f.departAirport = 'SFO' AND f.status = 'delayed';
