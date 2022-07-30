--criar banco--
 CREATE DATABASE "drivenbank";
 --tabela customers--
 CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
  "fullName" VARCHAR(100) NOT NULL,
  cpf VARCHAR(11) UNIQUE NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL
);
 --tabela customersPhones--
 CREATE TABLE "customersPhones" (
	id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES customers(id),
    number TEXT NOT NULL,
    type TEXT
  );
   --tabela states--
   CREATE TABLE states (
	id SERIAL PRIMARY KEY,
    name VARCHAR(50)
   );
   --tabela cities--
   CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    "stateId" INTEGER NOT NULL REFERENCES states(id)
   );
   --tabela customersAdress--
 CREATE TABLE "customersAdress" (
	id SERIAL PRIMARY KEY,
    "customerId" INTEGER UNIQUE NOT NULL REFERENCES customers(id),
    street TEXT NOT NULL,
    number INTEGER NOT NULL,
    complement VARCHAR(110),
    "postalCode" VARCHAR(8) NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES cities(id)
  );
    --tabela bankAccount--
   CREATE TABLE "bankAccount" (
	id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES customers(id),
    "accountNumber" TEXT NOT NULL,
    "agency" TEXT NOT NULL,
    "openDate" TIMESTAMP  NOT NULL DEFAULT NOW(),
    "closeDate" TIMESTAMP  
   );
   --tabela transactions--
   CREATE TABLE transactions (
	id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"(id),
    amount INTEGER NOT NULL,
    type TEXT NOT NULL,
    time TIMESTAMP NOT NULL DEFAULT NOW(),
    descripition VARCHAR(120),
    cancelled BOOLEAN
   );
    --tabela creditCards--
   CREATE TABLE "creditCards" (
	id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"(id),
    name VARCHAR(110) NOT NULL,
    number TEXT NOT NULL,
    "securityCode" VARCHAR(3) NOT NULL,
    "expirationMonth" VARCHAR(2) NOT NULL,
    "expirationYear" VARCHAR(4) NOT NULL,
     password TEXT NOT NULL,
     "limit" INTEGER NOT NULL
   );





