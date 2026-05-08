[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/_nqfEvW_)
# k-olap

## Задание 1: Агрегация с нарастающим итогом
Таблица: transactions (id, date, amount)
Задача:
Рассчитать накопительную сумму транзакций по дням.

```sql
SELECT
  date,
  amount,
  -- решение 
FROM transactions;
```

## Задание 2: Сравнение со средним по группе
Таблица: products (id, category, price)
Задача:
Вывести продукты, их категорию, цену и отклонение цены от средней по категории.

```sql
SELECT
  id,
  category,
  price,
  -- решение 
FROM products;
```

## Задание 3: Работа с границами окна
Таблица: temperature_logs (log_time, temperature)
Задача:
Вывести скользящее среднее температуры за последние 3 записи.

```sql
SELECT
  log_time,
  temperature,
  -- sql
FROM temperature_logs;
```

## Задание 4: Поиск первого и последнего значения
Таблица: project_tasks (task_id, project_id, start_date)
Задача:
Найти дату начала первой и последней задачи в проекте.

```sql
SELECT
  task_id,
  project_id,
  start_date,
  -- решение
FROM project_tasks;
```

## Задание 5:   На основе вашей модели создайте модель для OLAP

пример ![oltp](/oltp.jfif)

и модель звезда

![olap-star](/olap-snowflake.jfif)

Приложите результат- er-диаграмму в формате изображения olap.<IMG-TYPE>