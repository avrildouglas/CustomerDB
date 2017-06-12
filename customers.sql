/*SELECT COUNT(DISTINCT Company) Company FROM customers.mycustomers; */
/*(4A)*/
/*DROP TABLE customers.company;*/
use customers;
describe mycustomers;
CREATE TABLE customers.company(company_id INT NOT NULL AUTO_INCREMENT,
company VARCHAR(100), PRIMARY KEY (company_id));
/*(4B)*/
INSERT INTO company (company) SELECT DISTINCT Company FROM mycustomers;
/*(4C)*/
ALTER TABLE mycustomers ADD customer_id INT NOT NULL AUTO_INCREMENT;
/*(4D)*/
UPDATE mycustomers c  SET c. company_id  = (SELECT t.company_id FROM company t WHERE t.company=c.company);
/*(5A)*/
/*DROP TABLE customers.city;*/
CREATE TABLE customers.city(company_id INT NOT NULL AUTO_INCREMENT,
city VARCHAR(50), PRIMARY KEY (company_id));
/*(5B)*/
INSERT INTO city (city) SELECT DISTINCT city FROM mycustomers;
/*(5C)*/
/*DROP TABLE customers.state;*/
CREATE TABLE customers.state(company_id INT NOT NULL AUTO_INCREMENT,
state VARCHAR(2), PRIMARY KEY (company_id));
/*(5D)*/
INSERT INTO state (state) SELECT DISTINCT state FROM mycustomers;
/*(5E)*/
/*DROP TABLE customers.position;*/
CREATE TABLE customers.`position`(company_id INT NOT NULL AUTO_INCREMENT,
`position` VARCHAR(100), PRIMARY KEY (company_id));
/*(5F)*/
INSERT INTO `position` (`position`) SELECT `Position` FROM mycustomers;
/*(6)*/
ALTER TABLE mycustomers DROP Company;
ALTER TABLE mycustomers DROP City;
ALTER TABLE mycustomers DROP State;
ALTER TABLE mycustomers DROP `Position`;
/*(7)*/
SELECT FullName, company FROM mycustomers c INNER JOIN customers.company t ON c.company_id=t.company_id;
SELECT FullName, city FROM mycustomers c INNER JOIN customers.city y ON c.company_id=y.company_id;
SELECT FullName, state FROM customers.mycustomers c INNER JOIN customers.state e ON c.company_id=e.company_id;
SELECT FullName, `position` FROM customers.mycustomers c INNER JOIN customers.`position` p ON c.company_id=p.company_id;