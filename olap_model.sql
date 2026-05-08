-- ЗАДАНИЕ 5: Модель для OLAP (модель "Звезда")
-- 1. Таблица фактов 
CREATE TABLE fact_orders (
    order_id         BIGINT,           
    customer_id      BIGINT,           
    product_id       BIGINT,          
    warehouse_id     BIGINT,          
    employee_composed_id BIGINT,       
    employee_shipped_id BIGINT,        
    price_id         BIGINT,         
    quantity         INTEGER,          
    total_amount     DECIMAL(10,2),    
    order_date       DATE,             
    ship_date        DATE              
);

-- 2. Измерение: Клиент 
CREATE TABLE dim_customer (
    customer_id      BIGINT PRIMARY KEY,
    first_name       VARCHAR(100),
    last_name        VARCHAR(100),
    phone            VARCHAR(20),
    email            VARCHAR(150),
    address          VARCHAR(500),
    city             VARCHAR(100)
);

-- 3. Измерение: Товар
CREATE TABLE dim_product (
    product_id       BIGINT PRIMARY KEY,
    name             VARCHAR(200),
    category         VARCHAR(100),
    unit             VARCHAR(20),
    supplier         VARCHAR(200)
);

-- 4. Измерение: Склад 
CREATE TABLE dim_warehouse (
    warehouse_id     BIGINT PRIMARY KEY,
    address          VARCHAR(500),
    phone            VARCHAR(20),
    manager_id       BIGINT,
    warehouse_type   VARCHAR(50)
);

-- 5. Измерение: Сотрудник 
CREATE TABLE dim_employee (
    employee_id      BIGINT PRIMARY KEY,
    first_name       VARCHAR(100),
    last_name        VARCHAR(100),
    phone            VARCHAR(20),
    position         VARCHAR(100),
    department       VARCHAR(100)
);

-- 6. Измерение: Цена 
CREATE TABLE dim_price (
    price_id         BIGINT PRIMARY KEY,
    product_id       BIGINT,
    price            DECIMAL(10,2),
    start_date       DATE,
    end_date         DATE,
    is_current       BOOLEAN
);

-- 7. Измерение: Дата 
CREATE TABLE dim_date (
    date_id          DATE PRIMARY KEY,
    year             INTEGER,
    quarter          INTEGER,
    month            INTEGER,
    month_name       VARCHAR(20),
    day              INTEGER,
    day_of_week      INTEGER,
    day_name         VARCHAR(20),
    is_weekend       BOOLEAN
);
-- Пример аналитического запроса к модели "Звезда"
SELECT 
    p.category,
    d.year,
    d.month_name,
    SUM(f.total_amount) AS total_sales,
    SUM(f.quantity) AS items_sold
FROM fact_orders f
JOIN dim_product p ON f.product_id = p.product_id
JOIN dim_date d ON f.order_date = d.date_id
WHERE d.year = 2024
GROUP BY p.category, d.year, d.month_name
ORDER BY total_sales DESC;
