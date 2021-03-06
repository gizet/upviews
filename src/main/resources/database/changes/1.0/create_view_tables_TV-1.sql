CREATE SCHEMA IF NOT EXISTS UP_VIEWS;

CREATE TABLE IF NOT EXISTS UP_VIEWS.ROLE (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    ROLE VARCHAR(50) UNIQUE NOT NULL,

    INDEX(ROLE)
);



CREATE TABLE IF NOT EXISTS UP_VIEWS.RANK_ (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    RANK_TYPE VARCHAR(50) UNIQUE NOT NULL,

    INDEX(RANK_TYPE)
);



CREATE TABLE IF NOT EXISTS UP_VIEWS.PAYMENT (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    PAYMENT_TYPE VARCHAR(50) UNIQUE NOT NULL,

     INDEX(PAYMENT_TYPE)
);



CREATE TABLE IF NOT EXISTS UP_VIEWS.STATUS (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    STATUS VARCHAR(50)  UNIQUE NOT NULL,

    INDEX(STATUS)
);



CREATE TABLE IF NOT EXISTS UP_VIEWS.CATEGORY (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    CATEGORY VARCHAR(50) UNIQUE NOT NULL,

    INDEX(CATEGORY)
);


CREATE TABLE IF NOT EXISTS UP_VIEWS.TRANSACTION_TYPE (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    TRANSACTION_TYPE VARCHAR(50) UNIQUE NOT NULL,

    INDEX(TRANSACTION_TYPE)
);


CREATE TABLE IF NOT EXISTS UP_VIEWS.PRODUCT (
    ID BIGINT AUTO_INCREMENT    PRIMARY KEY,
    NAME                        VARCHAR(50) UNIQUE NOT NULL,
    PRICE                       DECIMAL(10,2) NOT NULL,
    AMOUNT                      INT NOT NULL,
    DISCOUNT                    DECIMAL(10,2) NOT NULL,
    CATEGORY_ID                 BIGINT NOT NULL,
    DESCRIPTION                 VARCHAR(255) DEFAULT NULL,

    FOREIGN KEY(CATEGORY_ID)
    REFERENCES CATEGORY(ID)
);



CREATE TABLE IF NOT EXISTS UP_VIEWS.ORDER_ (
    ID BIGINT AUTO_INCREMENT    PRIMARY KEY,
    ORDER_DATE                  DATETIME NOT NULL,
    PRODUCT_ID                  BIGINT NOT NULL,
    PAYMENT_ID                  BIGINT NOT NULL,
    STATUS_ID                   BIGINT NOT NULL,

    FOREIGN KEY(PRODUCT_ID)
    REFERENCES PRODUCT(ID),

    FOREIGN KEY(PAYMENT_ID)
    REFERENCES PAYMENT(ID),

    FOREIGN KEY(STATUS_ID)
    REFERENCES STATUS(ID)
);



CREATE TABLE IF NOT EXISTS UP_VIEWS.CART (
    ID BIGINT AUTO_INCREMENT    PRIMARY KEY,
    TYPE                        VARCHAR(50),
    CART_ORDER_DATE             DATETIME NOT NULL,
    ORDER_ID                    BIGINT,

    FOREIGN KEY(ORDER_ID)
    REFERENCES ORDER_(ID)

);



CREATE TABLE IF NOT EXISTS UP_VIEWS.ACCOUNT (
    ID BIGINT AUTO_INCREMENT    PRIMARY KEY,
    FIRST_NAME                  VARCHAR(50) NOT NULL,
    LAST_NAME                   VARCHAR(50) NOT NULL,
    EMAIL                       VARCHAR(50) NOT NULL,
    RANK_ID                     BIGINT NOT NULL,
    CART_ID                     BIGINT,

    FOREIGN KEY(RANK_ID)
    REFERENCES RANK_(ID),

    FOREIGN KEY(CART_ID)
    REFERENCES CART(ID)
);



CREATE TABLE IF NOT EXISTS UP_VIEWS.USER (
    ID BIGINT AUTO_INCREMENT    PRIMARY KEY,
    USER_NAME                   VARCHAR(50) UNIQUE NOT NULL,
    PASSWORD                    VARCHAR(200) NOT NULL,
    RESET_TOKEN                 VARCHAR(50) DEFAULT NULL,
    TOKEN_EXPIRATION            TIMESTAMP DEFAULT NULL,
    ROLE_ID                     BIGINT NOT NULL,
    ACCOUNT_ID                  BIGINT NOT NULL,

    FOREIGN KEY(ROLE_ID)
    REFERENCES ROLE(ID),

    FOREIGN KEY(ACCOUNT_ID)
    REFERENCES ACCOUNT(ID)

);




CREATE TABLE IF NOT EXISTS UP_VIEWS.WALLET (
    ID BIGINT AUTO_INCREMENT    PRIMARY KEY,
    NAME                        VARCHAR(50) NOT NULL DEFAULT 'WALLET',
    CURRENCY                    char(1) NOT NULL,
    BALANCE                     DECIMAL(10,2) NOT NULL,
    ACCOUNT_ID                  BIGINT NOT NULL,

    FOREIGN KEY(ACCOUNT_ID)
    REFERENCES ACCOUNT(ID)
    ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS UP_VIEWS.WALLET_TRANSACTION (
    ID BIGINT AUTO_INCREMENT    PRIMARY KEY,
    AMOUNT                      DECIMAL(10,2) NOT NULL,
    TRANSACTION_DATE            DATETIME NOT NULL,
    PAYMENT_ID                  BIGINT NOT NULL,
    TRANSACTION_TYPE_ID         BIGINT NOT NULL,
    WALLET_ID                   BIGINT,

    FOREIGN KEY(PAYMENT_ID)
    REFERENCES PAYMENT(ID),

    FOREIGN KEY(TRANSACTION_TYPE_ID)
    REFERENCES TRANSACTION_TYPE(ID),

    FOREIGN KEY(WALLET_ID)
    REFERENCES WALLET(ID)
);









